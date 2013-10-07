class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.references :car
      t.integer :amount
      t.date :season_sumer
      t.date :season_winter
      t.date :time_to

      t.timestamps
    end
    add_index :maintenances, :car_id
  end
end
