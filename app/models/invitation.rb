# == Schema Information
#
# Table name: invitations
#
#  id         :bigint           not null, primary key
#  email      :string
#  uuid       :string
#  company_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Invitation < ApplicationRecord
  belongs_to :company

  before_create :on_before_create
  after_create :on_after_create

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def on_before_create
    self.uuid = SecureRandom.hex.to_s
  end

  def on_after_create
    UserMailer.with(invitation: self).invitation_email.deliver_later
  end
end
