class AddEmailToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :email, :string
  end
end
