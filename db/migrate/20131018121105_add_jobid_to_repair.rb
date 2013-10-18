class AddJobidToRepair < ActiveRecord::Migration

    def change
      add_column :repairs, :job_id, :integer
      add_index :repairs, :job_id

    end
end
