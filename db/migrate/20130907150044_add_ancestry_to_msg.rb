class AddAncestryToMsg < ActiveRecord::Migration
  def self.up
    add_column :msgs, :ancestry, :string
    add_index :msgs, :ancestry
  end
  def self.down
    remove_index :msgs, :ancestry
    remove_column :msgs, :ancestry
  end
end
