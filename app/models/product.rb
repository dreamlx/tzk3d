class Product < ActiveRecord::Base
  attr_accessible :designer, :name, :photo, :price, :model3d, :desc, :size
  validates_presence_of :name, :model3d, :photo

  acts_as_rateable
  acts_as_commentable

  mount_uploader :photo, PhotoUploader
  mount_uploader :model3d, Model3dUploader
  
  has_many :product_relations, :class_name => 'ProductRelation'
  has_many :users, :through => :product_relations
  
  has_many :purchase_users, :through => :product_relations, :source => :user, :conditions => "rs_name = 'purchase'"
  has_many :favor_users, :through => :product_relations, :source => :user, :conditions => "rs_name = 'favor'"
  has_many :uploaded_user, :through => :product_relations, :source => :user, :conditions => "rs_name = 'uploaded'"
  
  
  def check_favor(current_user)
    ProductRelation.find_by_user_id_and_product_id(current_user.id, self.id).blank?
  end
  
  def favor_count
    self.favor_users.count
  end
  
  def owner?(user)
    !ProductRelation.find(:first, conditions: "product_id = #{self.id} and user_id = #{user.id} and rs_name = 'uploaded'").nil?
  end
end


# rate for selected post
#@post.rate_it( 4, current_user ) #=> true || false

# average rating of selected post
#@post.average_rating #=> 4.0
#@post.average_rating_round #=> 4
#@post.average_rating_percent #=> 80

# check if selected post rated by user
#@post.rated_by?( current_user ) #=> instance of rating model || false

#@post.parse_ratings(:json) #=> JSON formatted string containing the post's ratings

# find posts with rating '4'
#Post.find_average_of( 4 ) #=> array