class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  enum role: [:user, :owner, :admin]
  after_create :send_welcome_mail

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(
          full_name: data['name'],
          email: data['email'],
          password: Devise.friendly_token[0, 20],
          image: data['image']
      )
    end
    user
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver_later
  end
end
