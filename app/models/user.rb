class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  enum role: [:user, :owner, :admin]

  validates_presence_of :name

  before_create :on_before_create
  after_create :on_after_create

  def on_before_create
    self.auth_token = SecureRandom.hex.to_s
  end

  def on_after_create
    UserMailer.with(user: self).welcome_email.deliver_later
  end

end
