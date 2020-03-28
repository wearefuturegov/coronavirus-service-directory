class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

    create_join_table :categories, :services do |t|
      t.index :category_id
      t.index :service_id
    end
    
  end
end
