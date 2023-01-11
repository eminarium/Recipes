class PagesController < ApplicationController
  def followers
    @followers = current_user.followers
  end

  def followees
    @followees = current_user.followees
  end
end
