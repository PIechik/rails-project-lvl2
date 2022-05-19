class ChangePostCategoriesToCategories < ActiveRecord::Migration[6.1]
  def change
    rename_table :post_categories, :categories
  end
end
