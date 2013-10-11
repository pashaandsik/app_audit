class Job < ActiveRecord::Base
  belongs_to :car
  has_many :details, through: :car
  attr_accessible :km_n, :m_ch, :repair, :to , :car_id
  after_save :update_details_id
  def update_details_id


    Car.where('cars.id' => car_id ).each do  |car|
      if car.ch_all.nil?
        car.ch_all = 0
      end
      if car.km_all.nil?
        car.km_all = 0
      end
      car.km_all += km_n
      car.ch_all += m_ch
      car.save

    end

    Detail.where('details.car_id' => car_id ).each do |detail|
      if detail.job_id = id
        detail.time_de_all -= detail.time_de_job
        detail.km_de_all -= detail.km_de_job
        detail.km_de_job = km_n
        detail.time_de_job = m_ch
        detail.time_de_all += detail.time_de_job
        detail.km_de_all += detail.km_de_job
      else
        detail.job_id = id
        if detail.time_de_all.nil?
          detail.time_de_all = 0
        end
        if detail.km_de_all.nil?
          detail.km_de_all = 0
        end
        detail.km_de_job = km_n
        detail.time_de_job = m_ch
        detail.time_de_all += detail.time_de_job
        detail.km_de_all += detail.km_de_job
        detail.save
      end



    end
    if repair
      p "__________________________________________________________"
      #render repair_url
    end

    #Car.joins("LEFT JOIN jobs ON cars.id = jobs.car_id").joins("LEFT JOIN details ON cars.id = details.car_id").where('details.car_id' =>inire)
  end
end
