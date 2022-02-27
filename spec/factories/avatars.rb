FactoryBot.define do
  factory :avatar do
    url { Faker::Avatar.image }

    user
  end
end
