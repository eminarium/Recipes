class InstructionsController < ApplicationController

  before_action :set_recipe, only: [:new, :edit, :create, :update]
  before_action :set_instruction, only: [:edit, :update, :destroy]

  def new
    @instruction = @recipe.instructions.build
  end

  def edit
  end

  def create
    @instruction = @recipe.instructions.build(instruction_params)

    if @instruction.save
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Instruction was successfully added!" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @instruction.update(instruction_params)
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Instruction was successfully update!" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_recipe
    @recipe = Recipe.friendly.find(params[:recipe_id])
  end

  def set_instruction
    @instruction = Instruction.find(params[:id])
  end

  def instruction_params
    params.require(:instruction).permit(:content, :position, :recipe_id)
  end
end
