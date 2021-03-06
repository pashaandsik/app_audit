# coding: UTF-8
class Car < ActiveRecord::Base
  belongs_to :warranty
  has_many :details, dependent: :destroy
  has_many :jobs , dependent: :destroy
  has_many :repairs, dependent: :destroy
  attr_accessible :date_of_commissioning, :date_warranty, :name, :object_subdivisiod, :warranty_id
  validates :object_subdivisiod, :name, length: {minimum: 2, maximum: 20}


end
