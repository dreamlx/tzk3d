class Profile < ActiveRecord::Base
  attr_accessible :address, :first_name, :gender, :last_name, :avatar
  mount_uploader :avatar, AvatarUploader
  
  belongs_to :user
end
