class Recipe < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: :slugged
  
  self.per_page = 10

  has_rich_text :description

  # VALIDATIONS

  validates :title, presence: true
  validates :brief_info, presence: true
  validates :likes, :dislikes, presence: true
  validates :user_id, presence: true

  # ASSOCIATIONS
  belongs_to :user
  has_many :instructions, dependent: :destroy
end
