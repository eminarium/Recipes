class Instruction < ApplicationRecord

  # after_create_commit { broadcast_prepend_to "instructions" }
  # after_update_commit { broadcast_replace_to "instructions" }

  scope :ordered, -> { order(position: :asc) }

  acts_as_list scope: :recipe

  # VALIDATIONS
  validates :content, presence: true
  validates :recipe_id, presence: true

  # ASSOCIATIONS
  belongs_to :recipe

  def previous_instruction
    recipe.instructions.ordered.where("position < ?", position).last
  end
end
