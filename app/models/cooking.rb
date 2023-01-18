class Cooking < ApplicationRecord

  # VALIDATIONS
  validates :user_id, presence: true, uniqueness: { scope: :recipe_id }
  validates :recipe_id, presence: true, uniqueness: { scope: :user_id }

  # ASSOCIATIONS
  belongs_to :user
  belongs_to :recipe
end
