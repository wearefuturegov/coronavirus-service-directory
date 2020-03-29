class AddPublishedColumnToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :published, :boolean, null: false, default: false
  end
end
