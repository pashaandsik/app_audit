class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.string :object_subdivisiod
      t.date :date_of_commissioning
      t.date :date_warranty
      t.string :name_org_warranty

      t.timestamps
    end
  end
end
