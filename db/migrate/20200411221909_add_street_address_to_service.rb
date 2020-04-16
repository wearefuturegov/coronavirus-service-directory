class AddStreetAddressToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :street_address, :string
  end
end
