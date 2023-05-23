class RecipeIngredient < ApplicationRecord

  # ASSOCIATIONS
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :unit
end
