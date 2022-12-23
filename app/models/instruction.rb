class Instruction < ApplicationRecord

  after_create_commit { broadcast_prepend_to "stories" }

  acts_as_list scope: :recipe

  # VALIDATIONS
  validates :content, presence: true

  # ASSOCIATIONS
  belongs_to :recipe
end
