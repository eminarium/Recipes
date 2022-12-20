class RecipesController < ApplicationController
  
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if user_signed_in?
      @recipes = current_user.recipes.paginate(page: params[:page]).order(:created_at)
    else
      @recipes = Recipe.paginate(page: params[:page]).order(:created_at)
    end
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: "Recipe was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "Recipe was successfully destroyed."
  end

  private
  
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :brief_info, :description, :likes, :dislikes, :is_halal, :is_kosher, :is_vegetarian, :user_id)
  end
end
