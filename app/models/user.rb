class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ASSOCIATIONS
  has_many :recipes

  # CALLBACKS
  after_create :welcome_user

  def welcome_user
    UserMailer.welcome(self).deliver_now
  end

end
