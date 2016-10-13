class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :external_id
      t.string :secret_code

      t.timestamps null: false
    end

    create_table :location_groups_locations do |t|
      t.integer :location_id
      t.integer :location_group_id
    end
  end
end
