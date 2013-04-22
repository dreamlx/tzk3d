class Model3d < ActiveRecord::Base
  attr_accessible :modelfile, :title
  belongs_to :product
  mount_uploader :modelfile, Model3dUploader
end
