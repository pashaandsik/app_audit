class AddCaridToDetails < ActiveRecord::Migration
  def change
    add_column :jobs, :car_id, :integer
    add_index :jobs, :car_id
  end
end
