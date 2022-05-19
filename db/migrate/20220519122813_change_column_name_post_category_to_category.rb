class ChangeColumnNamePostCategoryToCategory < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :post_category_id, :category_id
  end
end
