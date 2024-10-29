FactoryBot.define do
  factory :player do
    user
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    active { true }
  end
end
