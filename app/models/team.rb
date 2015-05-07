class Team < ActiveRecord::Base

  mount_uploader :livery, ImageUploader

  validates :constructor, { uniqueness: true, presence: true }
  validates :driver1, :driver2,  { uniqueness: true, presence: true }
  validates :livery, presence: true
  validates :titles, { presence: true, numericality: { greater_than_or_equal_to: 0 } }

  belongs_to :user

  #### instance methods ####


  #### class methods ####

  class << self

    def search(search_with, _user = nil)
      search_with = "%#{search_with}%"
      if _user.nil?
        Team.where("constructor LIKE :search OR driver1 LIKE :search OR driver2 LIKE :search OR name LIKE :search", search: search_with)
      else
      _user.teams.where("constructor LIKE :search OR driver1 LIKE :search OR driver2 LIKE :search OR name LIKE :search", search: search_with)
      end
    end

  end

end
