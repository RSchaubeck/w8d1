class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string :name, null: false
      t.string :description
      t.integer :moderator_id, null: false
      t.timestamps
    end
    add_index :subs, :moderator_id
  end
end
