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
end
