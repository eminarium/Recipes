class RecipesList < ApplicationRecord

  # ASSOCIATIONS
  belongs_to :recipe
  belongs_to :list

  after_create :notify_recipe_owner_added_to_list
  after_destroy :notify_recipe_owner_removed_from_list

  def notify_recipe_owner_added_to_list
    UserMailer.recipe_added_to_list_notification(self.list, self.recipe).deliver_later
  end

  def notify_recipe_owner_removed_from_list
    UserMailer.recipe_removed_from_list_notification(self.list, self.recipe).deliver_later
  end
end
