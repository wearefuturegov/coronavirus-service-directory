class AddSellingPointsToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :key_points, :string, array:true, default: []
  end
end
