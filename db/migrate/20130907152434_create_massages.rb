class CreateMassages < ActiveRecord::Migration
  def change
    create_table :massages do |t|
      t.string :post

      t.timestamps
    end
  end
end
