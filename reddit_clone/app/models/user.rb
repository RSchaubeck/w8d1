class User < ApplicationRecord

    validates :name, :password_digest, :session_token, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }

    attr_reader :password

    after_initialize :ensure_session_token

    has_many :subs,
        foreign_key: :moderator_id,
        class_name: :Sub

    has_many :posts,
        foreign_key: :user_id,
        class_name: :Post

    def self.find_by_credentials(name, password)
        user = User.find_by(name: name)
        return nil unless user && user.is_password?(password)
        user
    end

    def is_password?(password)
        bc_pw = BCrypt::Password.new(self.password_digest)
        bc_pw.is_password?(password)
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def reset_session_token!
        self.update!(session_token: User.generate_session_token)
        self.session_token
    end

end