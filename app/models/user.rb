# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  name                   :string
#  slug                   :string
#  role                   :integer          default("user")
#  auth_token             :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string
#  uid                    :string
#  image_url              :string
#  stripe_customer_id     :string
#  subscription_id        :string
#  subscription_status    :string
#
class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :trackable

  enum role: [:user, :owner, :admin]

  validates_presence_of :name

  has_many :credit_cards
  has_many :payments

  before_create :on_before_create
  after_create :on_after_create

  def customer?
    stripe_customer_id.present? && credit_cards.present?
  end

  def subscriber?
    subscription_id.present? && subscription_status == 'active'
  end

  def first_time_user?
    sign_in_count == 0
  end

  def on_before_create
    self.auth_token = SecureRandom.hex.to_s
  end

  def on_after_create
    UserMailer.with(user: self).welcome_email.deliver_later
  end

  def self.from_google(google_identity)
    user = User.where(provider: 'Google', uid: google_identity.user_id).first
    return user if user.present?

    user = User.find_by_email(google_identity.email_address)

    if user.present?
      user.update(name: google_identity.name, image_url: google_identity.avatar_url, uid: google_identity.user_id, provider: 'Google')
      return user
    end

    if user.blank?
      user = User.create(
        name: google_identity.name,
        email: google_identity.email_address,
        password: Devise.friendly_token[0, 20],
        image_url: google_identity.avatar_url,
        provider: 'Google',
        uid: google_identity.user_id
      )
    end

    user
  end

end
