class AddAncestryToMassage < ActiveRecord::Migration
  def self.up
    add_column :massages, :ancestry, :string
    add_index :massages, :ancestry
  end
  def self.down
    remove_index :massages, :ancestry
    remove_column :massages, :ancestry
  end
end
