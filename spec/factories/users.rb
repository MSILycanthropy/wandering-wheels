FactoryBot.define do
  factory :user do
    id { 1 }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'password' }

    facility
  end
end
