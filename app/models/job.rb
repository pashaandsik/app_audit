class Job < ActiveRecord::Base
  belongs_to :car
  has_one :repair
  has_one :service, through: :car
  has_many :details, through: :car
  attr_accessible :km_n, :m_ch, :repair_job, :to , :car_id  , :season_bool
  after_save :update_details_id
  before_update :edit_job
  with_options if: :km_n_and_m_ch? do |km|
    km.validates :km_n, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    km.validates :m_ch, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  end

  validates :car, presence: true
  validates_presence_of :repair_job, acceptance: true, :if => :repair_job
  validates_presence_of :to, acceptance: true, :if => :to
  validates_presence_of :season_bool, acceptance: true, :if => :season_bool
  def km_n_and_m_ch?
      if repair_job || to || season_bool
        return false
      else
        return true
      end
  end

  def edit_job
    Detail.where('details.car_id' => car_id ).each do |detail|
      detail.km_de_all -= detail.km_de_job
      detail.time_de_all -=  detail.time_de_job
      detail.save
    end
  end

  def update_details_id
    if to
      servic_up_param

    elsif season_bool
      servic_up_param
    end

    unless repair_job or to

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
     #p detail.job_id.nil?
     if detail.job_id.nil?
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


    end


    #Car.joins("LEFT JOIN jobs ON cars.id = jobs.car_id").joins("LEFT JOIN details ON cars.id = details.car_id").where('details.car_id' =>inire)
  end

  private
  def servic_up_param

    if Service.where(car_id: car_id).empty?
      a= Service.new
      a.update_attributes( car_id: car_id, amount: 1, time_to: Time.new.strftime("%F"), season_sumer: Time.new(Time.new.year,04,19).strftime("%F") ,season_winter: Time.new(Time.new.year,10,19).strftime("%F")  )
      a.save
    else
      Service.where(car_id: car_id).each do |servic|
        servic.amount += 1
        servic.time_to = Time.new.strftime("%F")
        servic.save
      end

    end
  end

end

