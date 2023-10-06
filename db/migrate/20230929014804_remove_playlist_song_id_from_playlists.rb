class RemovePlaylistSongIdFromPlaylists < ActiveRecord::Migration[6.1]
  def change
    remove_column :playlists, :playlist_song_id
  end
end
