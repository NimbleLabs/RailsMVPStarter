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
