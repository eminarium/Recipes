class List < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: :slugged

  # VALIDATIONS
  validates :title, presence: true

  # ASSOCIATIONS
  belongs_to :user
  has_many :recipes_lists
  has_many :recipes, through: :recipes_lists
end
