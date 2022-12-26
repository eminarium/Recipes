class UsersController < ApplicationController

  before_action :set_user, only: [:show]
  skip_before_action :authenticate_user!

  def show
    @recipes = @user.recipes
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end