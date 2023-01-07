class LikesController < ApplicationController

  before_action :set_recipe

  def create
    current_user.liked_recipes << @recipe
    redirect_to(request.referer)
  end

  def destroy
    current_user.likes.find_by(likeable_id: @recipe.id).destroy
    redirect_to(request.referer)
  end

  def set_recipe
    @recipe = Recipe.friendly.find(params[:id])
  end

end
