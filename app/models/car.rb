class Car < ActiveRecord::Base
  belongs_to :warranty
  attr_accessible :date_of_commissioning, :date_warranty, :name, :object_subdivisiod, :warranty_id
end
