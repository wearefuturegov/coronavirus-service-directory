class RemoveUserFromServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :user_id
  end
end
