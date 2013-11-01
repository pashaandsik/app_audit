class Detail < ActiveRecord::Base
  has_ancestry
  belongs_to :car
  has_many :repairs , dependent: :destroy
  belongs_to :warranty
  has_many :jobs, through: :car

  attr_accessible :name_det, :km_de_all, :km_de_job, :km_de_warranty, :time_de_all, :time_de_job, :time_de_warranty,:parent_id, :car_id, :warranty_id,:ancestry

  validates :name_det, length: {minimum: 2, maximum: 20}
  validates :km_de_all, :km_de_job, :km_de_warranty,:time_de_all, :time_de_job, :time_de_warranty, numericality: {only_integer: true, greater_than_or_equal_to: 0}

end
