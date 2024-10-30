FactoryBot.define do
  factory :season do
    association :user
    sequence(:name) { |s| "Test Season #{s}" }
    start_date { Faker::Time.between(from: 1.year.ago, to: Time.now) }
    end_date { Faker::Time.between(from: Time.now + 1.day, to: Time.now + 365.days) }
  end
end
