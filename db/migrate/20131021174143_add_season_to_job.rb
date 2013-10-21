class AddSeasonToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :season_bool, :boolean
  end
end
