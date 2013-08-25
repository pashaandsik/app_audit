class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.references :car
      t.references :warranty
      t.integer :time_de_job
      t.integer :time_de_all
      t.integer :time_de_warranty
      t.integer :km_de_job
      t.integer :km_de_all
      t.integer :km_de_warranty

      t.timestamps
    end
    add_index :details, :car_id
    add_index :details, :warranty_id
  end
end
