class Relationship < ApplicationRecord

  # VALIDATIONS
  validates :follower_id, presence: true, uniqueness: { scope: :followee_id }
  validates :followee_id, presenece: true, uniqueness: { scope: :follower_id }

  # ASSOCIATIONS
  belongs_to :follower, class_name: "User"
  belongs_to :followee, class_name: "User"
end
