class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :car
      t.integer :amount
      t.date :season_sumer
      t.date :season_winter
      t.date :time_to

      t.timestamps
    end
    add_index :services, :car_id
  end
end
