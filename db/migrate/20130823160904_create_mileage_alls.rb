class CreateMileageAlls < ActiveRecord::Migration
  def change
    create_table :mileage_alls do |t|
      t.integer :km_all
      t.integer :m_ch_all
      t.references :car

      t.timestamps
    end
    add_index :mileage_alls, :car_id
  end
end
