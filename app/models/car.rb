class Car < ActiveRecord::Base
  belongs_to :warranty
  has_many :details
  has_many :job
  attr_accessible :date_of_commissioning, :date_warranty, :name, :object_subdivisiod, :warranty_id
end
