class Product < ActiveRecord::Base
  attr_accessible :designer, :name, :photo, :price, :rating, :model3d, :desc, :size

  mount_uploader :photo, PhotoUploader
  mount_uploader :model3d, Model3dUploader
end
