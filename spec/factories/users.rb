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
FactoryBot.define do

  factory :user do
    email { 'harris@helloworld.com' }
    password { "BuildSomethingGreat" }
    password_confirmation { "BuildSomethingGreat" }
    name { "Harris Reynolds" }

    factory :admin do
      email { "admin@helloworld.com" }
      role { :admin }
    end
  end

end
