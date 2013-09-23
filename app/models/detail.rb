class Detail < ActiveRecord::Base
  has_ancestry
  belongs_to :car
  belongs_to :warranty

  attr_accessible :name_det , :km_de_all, :km_de_job, :km_de_warranty, :time_de_all, :time_de_job, :time_de_warranty, :parent_id, :car_id, :warranty_id,:ancestry
end
