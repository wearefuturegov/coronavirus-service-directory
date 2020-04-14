class AddCaretakerFieldsToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :caretaker_phone, :string

    rename_column :services, :admin_email, :caretaker_email
  end
end
