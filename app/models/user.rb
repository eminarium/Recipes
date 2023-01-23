class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  # ASSOCIATIONS
  has_many :cookings
  has_many :cooked_recipes, through: :cookings, source: :recipe

  has_many :likes
  has_many :liked_recipes, through: :likes, source: :likeable, source_type: 'Recipe'
  
  has_many :recipes

  has_many :followed_users, foreign_key: :follower_id, class_name: "Relationship"
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: "Relationship"
  has_many :followers, through: :following_users

  has_many :lists

  # CALLBACKS
  after_create :welcome_user

  def welcome_user
    UserMailer.welcome(self).deliver_now
  end

  def likes?(recipe)
    liked_recipes.include?(recipe)
  end

  def cooked?(recipe)
    cooked_recipes.include?(recipe)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name
      user.avatar_url = auth.info.image

      # if you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation email.
      # user.skip_confirmation!
    end
  end

end