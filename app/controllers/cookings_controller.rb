class CookingsController < ApplicationController

  before_action :set_recipe

  def create
    current_user.cooked_recipes << @recipe
    redirect_to(request.referer)
  end

  def destroy
    current_user.cookings.find_by(recipe_id: @recipe.id).destroy
    redirect_to(request.referer)
  end

  private

  def set_recipe
    @recipe = Recipe.friendly.find(params[:id])
  end
end
