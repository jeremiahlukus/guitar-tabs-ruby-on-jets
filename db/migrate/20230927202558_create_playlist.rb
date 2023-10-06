class CreatePlaylist < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists do |t|
      t.string :name
      t.references :playlist_song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
