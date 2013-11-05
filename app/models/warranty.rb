class Warranty < ActiveRecord::Base
  has_many :cars
  has_one :detail
  attr_accessible :adds, :name
  validates :name, :adds, length: {minimum: 2, maximum: 20}
end
