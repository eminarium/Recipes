class RecipesListsController < ApplicationController

  before_action :set_recipe, :set_list

  def create
    @list.recipes << @recipe
    redirect_to(request.referer)
  end

  def destroy
    @list.recipes_lists.find_by(recipe_id: @recipe.id).destroy
    redirect_to(request.referer)
  end

  private

  def set_recipe
    @recipe = Recipe.friendly.find(params[:id])
  end

  def set_list
    @list = List.friendly.find(params[:list_id])
  end
end
