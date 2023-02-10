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

  def recipe_likes_count_badge(recipe)
    if recipe.likes_count > 0
      "<span class='badge bg-danger'><i class='fa-solid fa-heart me-1'></i> #{recipe.likes_count}</span>".html_safe
    end
  end

  def recipe_cooked_badge(user, recipe)
    if user && user.cooked?(recipe)
      "<span class='badge bg-dark'><i class='fa-solid fa-kitchen-set'></i></span>".html_safe
    end
  end

  def recipe_card_image(recipe)
    if recipe.image.attached?
      image_tag recipe.image, class: "card-img-top"
    else
      image_tag url_for("/assets/no-photo-icon-28.jpg"), class: "card-img-top"
    end
  end

  def recipe_tile_image(recipe)
    if recipe.image.attached?
      image_tag recipe.image, style: "height: 200px"
    else
      image_tag url_for("/assets/no-photo-icon-28.jpg"), style: "height: 200px"
    end
  end


end
