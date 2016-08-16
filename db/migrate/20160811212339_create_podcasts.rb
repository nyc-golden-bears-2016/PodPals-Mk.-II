class CreatePodcasts < ActiveRecord::Migration[5.0]
  def change
    create_table :podcasts do |t|
      t.string :genre, null: false
      t.string :title, null: false
      t.string :artist, null: false
      t.string :image30
      t.string :image60
      t.string :image100

      t.timestamps
    end
  end
end
