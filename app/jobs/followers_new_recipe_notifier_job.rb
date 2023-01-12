class FollowersNewRecipeNotifierJob < ApplicationJob
  queue_as :default

  def perform(recipe)
    followers = recipe.user.followers

    followers.each do |follower|
      UserMailer.follower_new_recipe_notification(recipe, follower).deliver_now
    end
  end
end
