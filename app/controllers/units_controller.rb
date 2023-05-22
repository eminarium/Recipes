class UnitsController < ApplicationController

  before_action :set_unit, only: [:edit, :update, :destroy]

  def index
    @units = Unit.all
  end

  def new
    @unit = Unit.new
  end

  def edit
  end

  def create
    @unit = Unit.new(unit_params)

    respond_to do |format|
      if @unit.save
        format.html { redirect_to units_path, notice: "Unit successfully created.", status: :created }
        format.turbo_stream { flash.now[:notice] = "Unit successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream {}
      end
    end
  end

  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to units_path, notice: "Unit successfully updated.", status: :ok }
        format.turbo_stream { flash.now[:notice] = "Unit successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream {}
      end
    end
  end

  def destroy
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to units_path, notice: "Unit was successfully destroyed.", status: :ok }
      format.turbo_stream { flash.now[:notice] = "Unit was successfully deleted..." }
    end
  end

  private

  def set_unit
    @unit = Unit.friendly.find(params[:id])
  end

  def unit_params
    params.require(:unit).permit(:name)
  end

end
