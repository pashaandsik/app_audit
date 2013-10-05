class AddChToCar < ActiveRecord::Migration
  def change
    add_column :cars, :ch_all, :integer
    add_column :cars, :km_all, :integer
  end
end
