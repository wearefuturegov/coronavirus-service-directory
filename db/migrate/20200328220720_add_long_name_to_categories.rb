class AddLongNameToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :long_name, :string
  end
end
