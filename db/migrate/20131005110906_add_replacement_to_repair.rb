class AddReplacementToRepair < ActiveRecord::Migration
  def change
    add_column :repairs, :detail_id, :integer
    add_column :repairs, :replacement, :boolean
    add_index :repairs, :detail_id

  end
end
