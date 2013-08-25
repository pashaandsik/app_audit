class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.string :object_subdivisiod
      t.date :date_of_commissioning
      t.date :date_warranty
      t.references :warranty

      t.timestamps
    end
    add_index :cars, :warranty_id
  end
end
