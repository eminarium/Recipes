class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :likes, :dislikes, presence: true
  # validates :user_id, presence: true
end
