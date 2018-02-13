FactoryBot.define do
  factory :user do
    user_name     { Faker::Twitter.unique.screen_name }
    email         { Faker::Internet.email }
    password      { Faker::Internet.password }
    password_confirmation { password }
  end
end