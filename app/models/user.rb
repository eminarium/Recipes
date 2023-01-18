class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
end