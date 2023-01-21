class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    bootstrap_mail(to: @user.email, subject: "Welcome to Recipes.com !")
  end

  def follow_notification(relationship)
    @follower = relationship.follower
    @followee = relationship.followee

    bootstrap_mail(to: @followee.email, subject: "You're being followed...")
  end

  def unfollow_notification(relationship)
    @follower = relationship.follower
    @followee = relationship.followee

    bootstrap_mail(to: @followee.email, subject: "You've been unfollowed...")
  end

  def recipe_like_notification(like)
    @liker = like.user
    @recipe = like.likeable
    @recipe_owner = @recipe.user

    bootstrap_mail(to: @recipe_owner.email, subject: "Your recipe has been liked...")
  end

  def recipe_unlike_notification(like)
    @liker = like.user
    @recipe = like.likeable
    @recipe_owner = @recipe.user

    bootstrap_mail(to: @recipe_owner.email, subject: "Your recipe has been liked...")
  end

  def follower_new_recipe_notification(recipe, follower)
    @recipe_owner = recipe.user
    @follower = follower
    @recipe = recipe

    bootstrap_mail(to: @follower.email, subject: "New Recipe from you follower...")
  end

  def mark_cooked_notification(cooking)
    @recipe_owner = cooking.recipe.user
    @recipe = cooking.recipe
    @user = cooking.user

    bootstrap_mail(to: @user.email, subject: "Your recipe #{@recipe.title} has been marked cooked by someone...")
  end

  def unmark_cooked_notification(cooking)
    @recipe_owner = cooking.recipe.user
    @recipe = cooking.recipe
    @user = cooking.user

    bootstrap_mail(to: @user.email, subject: "Your recipe #{@recipe.title} has been unmarked cooked by someone...")
  end

  def recipe_added_to_list_notification(list, recipe)
    @list = list
    @list_owner = list.user
    @recipe = recipe
    @recipe_owner = recipe.user
    
    bootstrap_mail(to: @recipe_owner.email, subject: "Your recipe has been added to list by #{@list_owner.email}")
  end

  def recipe_removed_from_list_notification(list, recipe)
    @list = list
    @list_owner = list.user
    @recipe = recipe
    @recipe_owner = recipe.user

    bootstrap_mail(to: @recipe_owner.email, subject: "Your recipe has been removed from list by #{@list_owner.email} ")
  end
end
