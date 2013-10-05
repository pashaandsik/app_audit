class Repair < ActiveRecord::Base
  belongs_to :car
  attr_accessible :cause, :car_id



end
