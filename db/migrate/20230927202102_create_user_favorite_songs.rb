class CreateUserFavoriteSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :user_favorite_songs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true
      t.timestamps
    end
  end
end
