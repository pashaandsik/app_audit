class Massage < ActiveRecord::Base
  has_ancestry
  attr_accessible :post, :parent_id, :ancestry
end
