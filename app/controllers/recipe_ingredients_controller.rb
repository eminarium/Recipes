class RecipeIngredientsController < ApplicationController
  
  before_action :set_recipe
  before_action :set_ingredient, only: [:create, :update, :destroy, :edit]

  def new
    @recipe_ingredient = RecipeIngredient.new
    @ingredients = Ingredient.all.order(:name)
    @units = Unit.all.order(:name)
  end

  def edit
    @recipe_ingredient = RecipeIngredient.find_by(recipe_id: @recipe.id, ingredient_id: @ingredient.id)
    @ingredients = Ingredient.all.order(:name)
    @units = Unit.all.order(:name)
  end

  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    @recipe_ingredient.recipe_id = @recipe.id
    @recipe_ingredient.save

    respond_to do |format|
      format.html { redirect_to(request.referer) }
      format.turbo_stream {}
    end
  end

  def update
    @recipe_ingredient = RecipeIngredient.find_by(recipe_id: @recipe.id, ingredient_id: @ingredient.id)
    @recipe_ingredient.update(recipe_ingredient_params)

    respond_to do |format|
      format.html { redirect_to(request.referer) }
      format.turbo_stream {}
    end   
  end

  def destroy
    @recipe_ingredient = RecipeIngredient.find_by(recipe_id: @recipe.id, ingredient_id: @ingredient.id)
    @recipe_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to(request.referer) }
      format.turbo_stream {}
    end    
  end

  private

  def set_recipe
    @recipe = Recipe.friendly.find(params[:recipe_id])
  end

  def set_ingredient
    @ingredient = Ingredient.friendly.find(params[:id])
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :unit_id, :amount)
  end

end
