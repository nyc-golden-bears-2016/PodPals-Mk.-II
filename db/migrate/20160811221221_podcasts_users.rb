class PodcastsUsers < ActiveRecord::Migration[5.0]
  def change
      create_table :podcasts_users do |t|
      t.integer :user_id, foreign_key: true, index: true
      t.integer :podcast_id, foreign_key: true, index: true
      t.boolean :favorite, default: false
      t.boolean :in_queue, default: false

      t.timestamps
    end
  end
end
