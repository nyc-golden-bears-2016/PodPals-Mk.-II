class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.integer :user_id, foreign_key: true, index: true
      t.integer :friend_id, foreign_key: true, index: true
      t.boolean :pending, default: true

      t.timestamps
    end
  end
end
