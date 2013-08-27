class AddAncestryToDetail < ActiveRecord::Migration
  def change
    add_column :details, :ancestry, :string
  end
end
