class Post < ApplicationRecord

    validates :title, presence: true

    belongs_to :sub,
        foreign_key: :sub_id,
        class_name: :Sub

    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

    has_many :post_subs,
        foreign_key: :post_id,
        class_name: :PostSub
end