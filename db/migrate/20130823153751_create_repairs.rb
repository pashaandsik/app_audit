class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.string :cause
      t.references :car

      t.timestamps
    end
    add_index :repairs, :car_id
  end
end
