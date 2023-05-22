class ListsController < ApplicationController

  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = current_user.lists
  end

  def show
    @recipes = @list.recipes.with_attached_image.includes([:tags, :user])
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)

    if @list.save
      respond_to do |format|
        format.html { redirect_to @list, status: :created }
        format.turbo_stream { flash.now[:notice] = "List was successfully added..." }
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "List has been successfully updated..." }
      end
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    
    respond_to do |format|
      format.html { redirect_to lists_path, status: :ok }
      format.turbo_stream { flash.now[:notice] = "List was successfully deleted..." }
    end
  end

  private
  
  def set_list
    @list = List.friendly.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :user_id)
  end
end
