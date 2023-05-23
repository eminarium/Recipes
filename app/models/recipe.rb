class Recipe < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_taggable_on :tags
  self.per_page = 10

  has_rich_text :description


  # SCOPES
  scope :top_liked, -> (n) { order(likes_count: :desc).with_attached_image.includes([:tags, :user]).limit(n) }

  # CALLBACKS
  after_create :notify_recipe_owner_followers


  # VALIDATIONS

  validates :title, presence: true
  validates :image, presence: true
  validates :brief_info, presence: true
  # validates :likes, :dislikes, presence: true
  validates :user_id, presence: true

  # ASSOCIATIONS

  has_one_attached :image
  has_many :cookings
  has_many :cooked_users, through: :cookings
  
  has_many :likes, as: :likeable
  belongs_to :user
  has_many :instructions, dependent: :destroy

  has_many :recipes_lists

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  # METHODS

  # def self.top_recipes(n)
  #   Recipe.
  # end

  def notify_recipe_owner_followers
    FollowersNewRecipeNotifierJob.perform_later(self)
  end

end
