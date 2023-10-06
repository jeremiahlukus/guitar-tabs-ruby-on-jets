class CreatePlaylistSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :playlist_songs do |t|
      t.references :song, null: false, foreign_key: true
      t.integer :playlist_order

      t.timestamps
    end
  end
end
