class Instruction < ApplicationRecord

  # VALIDATIONS

  validates :content, presence: true

  # ASSOCIATIONS

  belongs_to :recipe
end
