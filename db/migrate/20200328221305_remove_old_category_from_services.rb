class RemoveOldCategoryFromServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :category
  end
end
