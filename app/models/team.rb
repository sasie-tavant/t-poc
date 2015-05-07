class Team < ActiveRecord::Base

  mount_uploader :livery, ImageUploader

  validates :constructor, { uniqueness: true, presence: true }
  validates :driver1, :driver2,  { uniqueness: true, presence: true }
  validates :livery, presence: true
  validates :titles, { presence: true, numericality: { greater_than_or_equal_to: 0 } }

  belongs_to :user

end
