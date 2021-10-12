# == Schema Information
#
# Table name: credit_cards
#
#  id         :bigint           not null, primary key
#  last4      :string
#  brand      :string
#  exp_month  :integer
#  exp_year   :integer
#  country    :string
#  stripe_id  :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :credit_card do
    last4 { "MyString" }
    brand { "MyString" }
    exp_month { 1 }
    exp_year { 1 }
    country { "MyString" }
    stripe_id { "MyString" }
    user { nil }
  end
end
