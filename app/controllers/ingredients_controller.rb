class IngredientsController < ApplicationController

  before_action :set_ingredient, only: [:edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredients_path, notice: "Ingredient was successfully created.", status: :created }
        format.turbo_stream { flash.now[:notice] = "Ingredient was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream {}
      end
    end
  end

  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to ingredients_path, notice: "Recipe was successfully updated.", status: :ok }
        format.turbo_stream { flash.now[:notice] = "Recipe was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { }
      end
    end
  end

  def destroy
    @ingredient.destroy

    respond_to do |format|
      format.html { redirect_to ingredients_path, notice: "Ingredient was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Ingredient was successfully destroyed." }
    end
  end

  private

  def set_ingredient
    @ingredient = Ingredient.friendly.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
