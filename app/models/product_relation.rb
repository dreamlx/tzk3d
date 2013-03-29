class ProductRelation < ActiveRecord::Base
  attr_accessible :user_id, :product_id, :rs_name
  belongs_to :user
  belongs_to :product
  
end
