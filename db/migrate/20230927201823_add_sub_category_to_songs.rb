class AddSubCategoryToSongs < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :sub_category, :integer
  end
end
