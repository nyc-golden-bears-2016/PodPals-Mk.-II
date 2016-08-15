class CreatePodcasts < ActiveRecord::Migration[5.0]
  def change
    create_table :podcasts do |t|
      t.string :genre, null: false
      t.string :title, null: false
      t.string :artist, null: false

      t.timestamps
    end
  end
end
