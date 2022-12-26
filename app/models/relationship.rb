class Relationship < ApplicationRecord

  # VALIDATIONS
  validates :follower_id, presence: true, uniqueness: { scope: :followee_id }
  validates :followee_id, presence: true, uniqueness: { scope: :follower_id }

  # ASSOCIATIONS
  belongs_to :follower, class_name: "User"
  belongs_to :followee, class_name: "User"


  # CALLBACKS
  after_create :notify_user_followed
  after_destroy :notify_user_unfollowed


  def notify_user_followed
    UserMailer.follow_notification(self).deliver_now
  end

  def notify_user_unfollowed
    UserMailer.unfollow_notification(self).deliver_now
  end
end
