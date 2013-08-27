class Warranty < ActiveRecord::Base
  has_many :cars
  has_one :detail
  attr_accessible :adds, :name
end
