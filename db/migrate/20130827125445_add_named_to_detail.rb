class AddNamedToDetail < ActiveRecord::Migration
  def change
    add_column :details, :name_det, :string
  end
end
