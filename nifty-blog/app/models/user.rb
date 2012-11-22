class User < ActiveRecord::Base
  letsrate_rater
  # Others available devise modules are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

  has_many :posts

  # Tell the UserMailer to send a welcome Email after create
  after_create do |user|
  	UserMailer.welcome_email(user).deliver
  end
end
