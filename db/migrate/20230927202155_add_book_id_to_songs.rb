class AddBookIdToSongs < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :book_id, :integer
  end
end
