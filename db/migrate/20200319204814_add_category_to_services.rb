class AddCategoryToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :category, :string, array:true, default: []
  end
end
