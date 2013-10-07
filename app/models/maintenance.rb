class Maintenance < ActiveRecord::Base
  belongs_to :car
  attr_accessible :amount, :season_sumer, :season_winter, :time_to
end
