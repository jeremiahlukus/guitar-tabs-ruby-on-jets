class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :song_number, null: false
      t.string  :url
      t.string  :artist
      t.string  :lyrics
      t.string  :chords
      t.integer :category, default: 0
      t.integer :song_base_id
      t.string  :language
      t.timestamps
    end
  end
end
