class Category < ActiveRecord::Base
  acts_as_nested_set
  attr_accessible :name, :parent_id
  
  has_many :products, :order => 'created_at'
  has_many :published_products, :class_name => "Product",  :conditions => ["status =?", "approved"], :order => 'created_at'
end
