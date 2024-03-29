class RecipesController < ApplicationController
  
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :tagged]

  def index
    unless params[:per_page].present?
      params[:per_page] = 10
    end

    type = params[:type]

    if user_signed_in?
      @recipes = case type
      when "shared"
        Recipe.where.not(user_id: current_user.id)
      when "liked"
        current_user.liked_recipes
      else
        current_user.recipes
      end
    else
      @recipes = Recipe.all
    end

    @recipes = @recipes.with_attached_image.includes([:tags, :user]).paginate(page: params[:page], per_page: params[:per_page]).order(:created_at)
  end

  def tagged
    if params[:tag].present?
      @recipes = Recipe.tagged_with(params[:tag])
    else
      @recipes = Recipe.all
    end

    @recipes = @recipes.with_attached_image.includes([:tags, :user]).paginate(page: params[:page], per_page: params[:per_page]).order(:created_at)
  end

  def show
    @instructions = @recipe.instructions.order(:position)
    @ingredients = @recipe.recipe_ingredients.includes(:ingredient, :unit)
    @lists = current_user && current_user.lists.any? ? current_user.lists.includes([:recipes]) : []
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: "Recipe was successfully created.", status: :created }
        format.turbo_stream { flash.now[:notice] = "Recipe was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { }
      end
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
    @recipe = Recipe.friendly.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :brief_info, :description, :likes, :dislikes, :is_halal, :is_kosher, :is_vegetarian, :user_id, :image, :tag_list)
  end
end
