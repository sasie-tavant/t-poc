class Team < ActiveRecord::Base

  mount_uploader :livery, ImageUploader

  belongs_to :user

end
