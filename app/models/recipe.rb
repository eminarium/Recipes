class Recipe < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: :slugged
  
  self.per_page = 10

  has_rich_text :description

  # CALLBACKS
  after_create :notify_recipe_owner_followers

  def notify_recipe_owner_followers
    FollowersNewRecipeNotifierJob.perform_later(self)
  end

  # VALIDATIONS

  validates :title, presence: true
  validates :brief_info, presence: true
  # validates :likes, :dislikes, presence: true
  validates :user_id, presence: true

  # ASSOCIATIONS
  has_many :cookings
  has_many :cooked_users, through: :cookings
  
  has_many :likes, as: :likeable
  belongs_to :user
  has_many :instructions, dependent: :destroy
end
