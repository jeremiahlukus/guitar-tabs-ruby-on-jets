class AddSongBaseIdToPlaylistSong < ActiveRecord::Migration[6.1]
  def change
    add_column :playlist_songs, :song_base_id, :integer
  end
end
