class Translation < ApplicationRecord
  belongs_to :revisore, class_name: "User", foreign_key: :revisore_id
  belongs_to :traduttore, class_name: "User", foreign_key: :traduttore_id
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
