class AddPlaylistToPlaylistSongs < ActiveRecord::Migration[6.1]
  def change
    add_reference :playlist_songs, :playlist, null: false, foreign_key: true
  end
end
