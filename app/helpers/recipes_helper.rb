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

  def recipe_liked_icon(user, recipe)
    if user && user.likes?(recipe)
      "<div class='like-button'>
        <span class='p-1' style='border: 1px solid white; border-radius: 5px; background-color: white;'>
          <i class='fa fa-heart'></i>
        </span>
      </div>"
      .html_safe
    end
  end

  def recipe_card_image(user, recipe)
    if recipe.image.attached?
      "<div class='outer-container'>
        <div class='image-container'>
          #{recipe_liked_icon(user, recipe)}
          #{image_tag recipe.image, class: 'card-img-top image'}
        </div>
      </div>"
      .html_safe
    else
      "<div class='outer-container'>
        <div class='image-container'>
          #{recipe_liked_icon(user, recipe)}
          #{image_tag url_for('/assets/no-photo-icon-28.jpg'), class: 'card-img-top image'}
        </div>
      </div>"
      .html_safe           
    end
  end

  def recipe_tile_image(user, recipe)
    if recipe.image.attached?
      "<div class='outer-container'>
        <div class='image-container'>
          #{recipe_liked_icon(user, recipe)}
          #{image_tag recipe.image, class: 'image', style: 'height: 200px'}
        </div>
      </div>"
      .html_safe
    else
      "<div class='outer-container'>
        <div class='image-container'>
          #{recipe_liked_icon(user, recipe)}
          #{image_tag url_for('/assets/no-photo-icon-28.jpg'), class: 'image', style: 'height: 200px'}
        </div>
      </div>"
      .html_safe      
    end
  end

  def recipe_info_image(user, recipe)
    if recipe.image.attached?
      "<div class='outer-container'>
        <div class='image-container'>
          #{recipe_liked_icon(user, recipe)}
          #{image_tag recipe.image, class: 'image', style: 'width: 100%'}
        </div>
      </div>"
      .html_safe
    else
      "<div class='outer-container'>
        <div class='image-container'>
          #{recipe_liked_icon(user, recipe)}
          #{image_tag url_for('/assets/no-photo-icon-28.jpg'), class: 'image', style: 'width: 100%'}
        </div>
      </div>"
      .html_safe           
    end
  end

  def recipe_tags(recipe)
    recipe.tags.map{ |tag| recipe_tag(tag) }.join(" ").html_safe
  end

  def recipe_tag(tag)
    "<span class='badge bg-secondary'># #{tag.name}</span>"
  end

end
