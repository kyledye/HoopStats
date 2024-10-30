FactoryBot.define do
  factory :shot_type do
    sequence(:name) { |n| "Shot Type #{n}" }
    active { true }
    sequence(:sort_order) { |n| n }
  end
end
