class Recipe < ApplicationRecord

  has_rich_text :description

  validates :title, presence: true
  validates :brief_info, presence: true
  validates :likes, :dislikes, presence: true
  # validates :user_id, presence: true
end
