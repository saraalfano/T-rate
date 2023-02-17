class Rating < ApplicationRecord
  belongs_to :translation
  belongs_to :user
  after_save :update_average
  after_destroy :update_average

  def update_average
    @translation = Translation.find(self.translation_id)
    @user = User.find(@translation.traduttore_id)
    if Rating.where(translation_id: Translation.where(traduttore_id: @user.id).order(created_at: :desc).limit(10)).average(:voto)
      @media = Rating.where(translation_id: Translation.where(traduttore_id: @user.id).order(created_at: :desc).limit(10)).average(:voto).round(1)
    else
      @media = 0.0
    end
    @user.update_attribute(:score, @media)
  end
end
