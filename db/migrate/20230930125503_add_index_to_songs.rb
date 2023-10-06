class AddIndexToSongs < ActiveRecord::Migration[6.1]
  def change
    enable_extension("pg_trgm");
    add_index(:songs, :lyrics, using: 'gin', opclass: :gin_trgm_ops)
    add_index(:songs, :title, using: 'gin', opclass: :gin_trgm_ops)
  end
end
