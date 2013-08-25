class MileageAll < ActiveRecord::Base
  belongs_to :car
  attr_accessible :km_all, :m_ch_all
end
