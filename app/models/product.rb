class Product < ActiveRecord::Base
  attr_accessible :designer, :name, :price, :desc, :size, :category_id
  attr_accessible :model3ds_attributes, :pics_attributes
  validates_presence_of :name

  acts_as_rateable
  acts_as_commentable
  
  #scope :published, lambda { |item| where(["status = ?", "approved"]) }
  
  has_many :model3ds
  
  has_many :pics, as: :picable
  
  accepts_nested_attributes_for :pics, 
                                allow_destroy: true, 
                                reject_if: :all_blank
                                
  accepts_nested_attributes_for :model3ds, 
                                allow_destroy: true, 
                                reject_if: :all_blank
  
  has_many :product_relations, class_name: 'ProductRelation'
  
  has_many :users, through: :product_relations
  
  has_many  :purchase_users, 
            through: :product_relations, 
            source: :user, 
            conditions: "rs_name = 'purchase'"
            
  has_many :favor_users, :through => :product_relations, :source => :user, :conditions => "rs_name = 'favor'"
  has_many :uploaded_user, :through => :product_relations, :source => :user, :conditions => "rs_name = 'uploaded'"
  
  belongs_to :category
  
  state_machine :status, initial: :pending do
    state :pending
    state :unapproved
    state :approved

    event :disapprove do
      transition [:pending, :approved, nil]     => :unapproved
    end 
    
    event :edit do
      transition [:unapproved, :approved]  => :pending
    end
    
    event :approve do
      transition [:pending, nil, :unapproved]     => :approved
    end    
  end
  
  def photo
    self.pics.first.photo
  end
  
  def check_favor(current_user)
    ProductRelation.where(:user_id => current_user.id, :rs_name => "favor", :product_id => self.id).size > 0
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