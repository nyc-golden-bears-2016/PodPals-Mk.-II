class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.integer :user_id, foreign_key: true, index: true
      t.integer :friend_id, as: :user, foreign_key: true, index: true
      t.boolean :pending

      t.timestamps
    end
  end
end
