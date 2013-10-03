class Job < ActiveRecord::Base
  belongs_to :car
  has_many :details, through: :car
  attr_accessible :km_n, :m_ch, :repair, :to , :car_id
  after_save :update_details_id
  def update_details_id
    @inire=car_id
    p "-------------------------"
    p Detail.joins(:car, :jobs)
  end
end
