class Service < ActiveRecord::Base
  belongs_to :car
  belongs_to :job
  attr_accessible :car_id,:amount, :season_sumer, :season_winter, :time_to
end
