class Translation < ApplicationRecord
  belongs_to :revisore, class_name: "User"
  has_many :ratings
  has_one_attached :originale
  has_one_attached :tradotto
  has_one_attached :revisionato

  before_destroy :destroy_ratings
  
  private

    def destroy_ratings
      self.ratings.destroy_all
    end

end
