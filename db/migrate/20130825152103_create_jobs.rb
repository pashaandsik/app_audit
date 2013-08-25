class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.boolean :repair
      t.boolean :to
      t.integer :km_n
      t.integer :m_ch

      t.timestamps
    end
  end
end
