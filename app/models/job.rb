class Job < ActiveRecord::Base
  belongs_to :car
  has_many :details, through: :car
  attr_accessible :km_n, :m_ch, :repair, :to , :car_id
  after_save :update_details_id
  def update_details_id
    Detail.where('details.car_id' => car_id).each do |detail|
      detail.job_id = id

      detail.save
    end
    #Car.joins("LEFT JOIN jobs ON cars.id = jobs.car_id").joins("LEFT JOIN details ON cars.id = details.car_id").where('details.car_id' =>inire)
  end
end
