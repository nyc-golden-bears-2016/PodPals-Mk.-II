class ArtistPodcasts < ActiveRecord::Migration[5.0]
  def change
    create_table :artists_podcasts do |t|
      t.integer :artist_id, foreign_key: true, index: true
      t.integer :podcast_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
