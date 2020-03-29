class AddSecondEmailToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :admin_email, :string
  end
end
