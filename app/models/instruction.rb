class Instruction < ApplicationRecord

  # after_create_commit { broadcast_prepend_to "instructions" }
  # after_update_commit { broadcast_replace_to "instructions" }

  acts_as_list scope: :recipe

  # VALIDATIONS
  validates :content, presence: true

  # ASSOCIATIONS
  belongs_to :recipe
end
