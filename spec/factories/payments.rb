FactoryBot.define do
  factory :payment do
    amount { 1 }
    description { "MyString" }
    status { "MyString" }
    stripe_id { "MyString" }
    stripe_customer_id { "MyString" }
    created { 1 }
    user { nil }
  end
end
