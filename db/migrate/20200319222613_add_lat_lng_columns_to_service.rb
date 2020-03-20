class AddLatLngColumnsToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :latitude, :decimal
    add_column :services, :longitude, :decimal
  end
end
