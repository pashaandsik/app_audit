class Repair < ActiveRecord::Base
  belongs_to :car
  belongs_to :detail
  attr_accessible :cause, :car_id, :detail_id, :replacement
  after_save :update_details_params

  def update_details_params
    if replacement
      Detail.where('details.id' => detail_id ).each do |detail|
        detail.km_de_job = 0
        detail.time_de_job = 0
        detail.time_de_all = 0
        detail.km_de_all = 0
        p detail
        detail.save
      end
    end
  end
end
