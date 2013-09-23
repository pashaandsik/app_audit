class Job < ActiveRecord::Base
  belongs_to :car
  attr_accessible :km_n, :m_ch, :repair, :to , :car_id
end
