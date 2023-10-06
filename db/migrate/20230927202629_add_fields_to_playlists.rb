class AddFieldsToPlaylists < ActiveRecord::Migration[6.1]
  def change
    add_column :playlists, :language, :string
    add_column :playlists, :song_base_id, :integer
  end
end
