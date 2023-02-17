class Translation < ApplicationRecord
  belongs_to :revisore, class_name: "User"
  has_many :ratings
  has_one_attached :originale
  has_one_attached :tradotto
  has_one_attached :revisionato
  validates :titolo, presence: true
  validates :deadline, presence: true
  validates :stagione, presence: true, if: :serie_check
  validates :episodio, presence: true, if: :serie_check
  validates :originale, presence: true

  before_destroy :destroy_ratings
  
  private

    def destroy_ratings
      self.ratings.destroy_all
    end

    def serie_check
      tipo=="serie"
    end
end
