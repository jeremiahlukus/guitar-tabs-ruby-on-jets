class AddIndexToChordTabs < ActiveRecord::Migration[6.1]
  def change
    enable_extension("pg_trgm");
    add_index(:chords, :name, using: 'gin', opclass: :gin_trgm_ops)
  end
end
