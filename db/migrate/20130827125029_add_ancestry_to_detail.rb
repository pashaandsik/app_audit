class AddAncestryToDetail < ActiveRecord::Migration
  def self.up
    add_column :details, :ancestry, :string
    add_index :details, :ancestry
  end
  def self.down
    remove_index :details, :ancestry
    remove_column :details, :ancestry
  end

end
