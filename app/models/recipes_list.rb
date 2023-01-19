class RecipesList < ApplicationRecord

  # ASSOCIATIONS
  belongs_to :recipe
  belongs_to :list
end
