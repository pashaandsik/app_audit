class Msg < ActiveRecord::Base
  has_ancestry
  attr_accessible :nikolio, :parent_id, :ancestry
end
