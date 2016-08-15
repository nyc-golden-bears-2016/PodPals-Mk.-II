class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.references :user
      t.references :friend, as: :user
      t.boolean :pending

      t.timestamps
    end
  end
end
