class UsersController < ApplicationController

  before_action :set_user, only: [:show]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @recipes = @user.recipes.with_attached_image.includes([:tags])
  end

  def profile
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end