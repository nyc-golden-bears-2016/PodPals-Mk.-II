class CreateDiscussions < ActiveRecord::Migration[5.0]
  def change
    create_table :discussions do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :user_id, foreign_key: true, index: true
      t.integer :podcast_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
