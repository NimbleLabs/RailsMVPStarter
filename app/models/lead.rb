# == Schema Information
#
# Table name: leads
#
#  id         :bigint           not null, primary key
#  email      :string
#  user_id    :bigint           not null
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Lead < ApplicationRecord
  extend FriendlyId
  friendly_id :email_prefix, use: [:slugged, :finders]

  belongs_to :user, optional: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_uniqueness_of :email

  after_create :on_after_create

  private

  def on_after_create
    UserMailer.with(user: self).lead_email.deliver_later
  end

  def email_prefix
    at_index = email.index('@')
    return '' if at_index.blank?
    email[0, at_index]
  end
end
