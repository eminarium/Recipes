class Instruction < ApplicationRecord

  acts_as_list scope: :recipe

  # VALIDATIONS
  validates :content, presence: true

  # ASSOCIATIONS
  belongs_to :recipe
end
