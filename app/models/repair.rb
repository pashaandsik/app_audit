class Repair < ActiveRecord::Base
  belongs_to :car
  belongs_to :detail
  attr_accessible :cause, :car_id, :detail_id, :replacement

end
