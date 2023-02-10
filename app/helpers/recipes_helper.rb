module RecipesHelper

  def halal_badge(recipe)
    "<span class='badge bg-primary'>halal</span>".html_safe if recipe.is_halal
  end

  def kosher_badge(recipe)
    "<span class='badge bg-warning'>kosher</span>".html_safe if recipe.is_kosher
  end

  def vegetarian_badge(recipe)
    "<span class='badge bg-success'>vegetarian</span>".html_safe if recipe.is_vegetarian
  end

  def recipe_badges(recipe)
    "#{halal_badge(recipe)} #{kosher_badge(recipe)} #{vegetarian_badge(recipe)}".html_safe
  end

end
