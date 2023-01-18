class Like < ApplicationRecord

  # VALIDATIONS
  validates :user_id, presence: true, uniqueness: { scope: [:likeable_id, :likeable_type] }

  # ASSOCIATIONS
  belongs_to :user
  belongs_to :likeable, polymorphic: true


  # CALLBACKS
  after_create :notify_liked_recipe_user
  after_destroy :notify_unliked_recipe_user


  def notify_liked_recipe_user
    UserMailer.recipe_like_notification(self).deliver_now
  end

  def notify_unliked_recipe_user
    UserMailer.recipe_unlike_notification(self).deliver_now
  end
end
