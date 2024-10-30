FactoryBot.define do
  factory :team do
    user
    name { Faker::Sports::Basketball.team }
    abbreviation { Faker::Address.country_code }
    is_opponent { false }
    primary_color { Faker::Color.hex_color }
    secondary_color { Faker::Color.hex_color }
    active { true }
    sequence(:sort_order) { |n| n }
  end
end
