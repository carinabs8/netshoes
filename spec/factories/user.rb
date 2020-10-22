FactoryBot.define do
  factory :user do
  	email { Faker::Internet.email }
    password {"abc,123"}
    password_confirmation {"abc,123"}
    role {"admin"}
  end
end
