class AddFieldsToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :recommended, :boolean
    add_column :services, :how_to_contact, :string
  end
end
