class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.string :url
      t.array :key_points

      t.timestamps
    end
  end
end
