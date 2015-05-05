class Team < ActiveRecord::Base

  mount_uploader :livery, ImageUploader

end
