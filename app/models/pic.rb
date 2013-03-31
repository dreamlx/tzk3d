class Pic < ActiveRecord::Base
  belongs_to :picable, :polymorphic => true
  attr_accessible :photo, :title
  mount_uploader :photo, PhotoUploader
end
