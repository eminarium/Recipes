class RelationshipsController < ApplicationController

  before_action :set_user

  def create
    current_user.followees << @user
    redirect_to(request.referer)
  end

  def destroy
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_to(request.referer)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
