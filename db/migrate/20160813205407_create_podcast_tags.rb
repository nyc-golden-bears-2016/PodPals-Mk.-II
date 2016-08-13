class CreatePodcastTags < ActiveRecord::Migration[5.0]
  def change
    create_table :podcast_tags do |t|
    	t.integer :tag_id, foreign_key: true, index: true
    	t.integer :podcast_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
