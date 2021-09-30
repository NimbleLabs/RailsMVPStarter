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
