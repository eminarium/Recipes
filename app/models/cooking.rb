class Cooking < ApplicationRecord

  # VALIDATIONS
  validates :user_id, presence: true, uniqueness: { scope: :recipe_id }
  validates :recipe_id, presence: true, uniqueness: { scope: :user_id }

  # ASSOCIATIONS
  belongs_to :user
  belongs_to :recipe

  # CALLBACKS
  after_create :notify_recipe_marked_cooked
  after_destroy :notify_recipe_unmarked_cooked

  def notify_recipe_marked_cooked
    UserMailer.unmark_cooked_notification(self).deliver_now
  end

  def notify_recipe_unmarked_cooked
    UserMailer.mark_cooked_notification(self).deliver_now
  end
end
