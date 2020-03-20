class AddPostcodeToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :postcode, :string
  end
end
