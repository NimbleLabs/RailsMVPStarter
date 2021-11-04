FactoryBot.define do
  factory :coupon_code do
    code { "MyString" }
    offer { "MyString" }
    user { nil }
  end
end
