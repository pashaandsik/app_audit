class Detail < ActiveRecord::Base
  belongs_to :car
  belongs_to :warranty
  attr_accessible :km_de_all, :km_de_job, :km_de_warranty, :time_de_all, :time_de_job, :time_de_warranty
end
