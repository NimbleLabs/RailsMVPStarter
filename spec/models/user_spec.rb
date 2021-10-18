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
#  company_name           :string
#  company_id             :integer
#  invitation_uuid        :string
#
require 'rails_helper'

RSpec.describe User, type: :model do

  context "saving a User should behave correctly" do
    it "does not save without required data" do
      user = User.new
      user.save
      expect(user.errors.any?).to eq true
      expect(user.errors.to_a.length).to eq 3
      expect(user.id.nil?).to eq true
    end
  end

end
