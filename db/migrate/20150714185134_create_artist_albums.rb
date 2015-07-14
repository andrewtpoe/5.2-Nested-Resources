class CreateArtistAlbums < ActiveRecord::Migration
  def change
    create_table :artist_albums do |t|
      t.integer :artist_id, null: false
      t.integer :album_id, null: false

      t.timestamps null: false
    end

    add_index :artist_albums, [:artist_id, :album_id], unique: true

  end
end
