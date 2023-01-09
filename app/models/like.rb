class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  after_create :notify_liked_recipe_user
  after_destroy :notify_unliked_recipe_user


  def notify_liked_recipe_user
    UserMailer.recipe_like_notification(self).deliver_now
  end

  def notify_unliked_recipe_user
    UserMailer.recipe_unlike_notification(self).deliver_now
  end
end
