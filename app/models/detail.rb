class Detail < ActiveRecord::Base
  has_ancestry
  belongs_to :car
  has_many :repairs
  belongs_to :warranty
  has_many :jobs, through: :car

  attr_accessible :name_det , :km_de_all, :km_de_job, :km_de_warranty, :time_de_all, :time_de_job, :time_de_warranty, :parent_id, :car_id, :warranty_id,:ancestry

  after_save :collection_of_values
  def collection_of_values
    #Detail.find(id) do  |detal|
    #  detal.time_de_all = detal.time_de_all + detal.time_de_job
    #  #detal.km_de_all += km_de_job
    #  detal.save
    #end

    #time_de_all.to_int
    #time_de_all = time_de_all + time_de_job
    #save(    time_de_all  )
    # km_de_job
    #p time_de_all
  end
end
