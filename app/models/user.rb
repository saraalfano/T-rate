class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  has_one_attached :avatar
  has_many :translations, :class_name => "Translation", :foreign_key => "traduttore_id"
  has_many :translations, :class_name => "Translation", :foreign_key => "revisore_id"
  has_many :ratings
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :favorited, source_type: 'User'

  # def initialize(attributes=nil)
  #   attr_with_defaults = {:ruolo => "Utente", :score => 0.0}.merge(attributes)
  #   super(attr_with_defaults)
  # end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.nome = auth.info.first_name
      user.cognome = auth.info.last_name
      user.avatar_url = auth.info.image
    end
  end

end