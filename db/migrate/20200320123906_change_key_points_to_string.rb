class ChangeKeyPointsToString < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :key_points
    
    add_column :services, :key_point_1, :string
    add_column :services, :key_point_2, :string
    add_column :services, :key_point_3, :string
  end
end
