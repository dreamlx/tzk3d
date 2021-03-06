class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name
  
  has_one :profile
  accepts_nested_attributes_for :profile
  
  has_many :product_relations, :class_name => 'ProductRelation'
  
  has_many :purchases, :class_name => 'ProductRelation', :conditions => "product_relations.rs_name = 'purchase'"
  has_many :favors, :class_name => 'ProductRelation', :conditions => "product_relations.rs_name = 'favor'"
  has_many :uploadeds, :class_name => 'ProductRelation', :conditions => "product_relations.rs_name = 'uploaded'"
  
  has_many :products, :through => :product_relations
  
  has_many :purchase_products, :through => :product_relations, :source => :product, :conditions => "product_relations.rs_name = 'purchase'"
  has_many :favor_products, :through => :product_relations, :source => :product, :conditions => "product_relations.rs_name = 'favor'"
  has_many :uploaded_products, :through => :product_relations, :source => :product, :conditions => "product_relations.rs_name = 'uploaded'"
end
