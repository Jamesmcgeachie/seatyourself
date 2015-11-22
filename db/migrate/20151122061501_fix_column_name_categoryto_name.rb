class FixColumnNameCategorytoName < ActiveRecord::Migration
  def change
  	rename_column :Categories, :category, :category_name
  end
end
