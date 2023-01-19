class List < ApplicationRecord

  # VALIDATIONS
  validates :title, presence: true

  # ASSOCIATIONS
  belongs_to :user
end
