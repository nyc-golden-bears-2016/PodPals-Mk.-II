class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :user_id, foreign_key: true, index: true
      t.integer :discussion_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
