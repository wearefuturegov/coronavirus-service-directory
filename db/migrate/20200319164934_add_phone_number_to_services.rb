class AddPhoneNumberToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :phone, :string
  end
end
