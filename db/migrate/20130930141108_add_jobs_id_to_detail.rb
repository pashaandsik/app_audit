class AddJobsIdToDetail < ActiveRecord::Migration
  def change
    add_column :details, :job_id, :integer
    add_index :details, :job_id
  end
end
