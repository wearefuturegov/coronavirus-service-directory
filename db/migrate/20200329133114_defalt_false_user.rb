class DefaltFalseUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :admin, :boolean, null: false, default: false
  end
end
