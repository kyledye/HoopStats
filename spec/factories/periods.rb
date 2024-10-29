FactoryBot.define do
  factory :period do
    sequence(:name) { |n| "Q#n{}" }
    is_overtime { false }
    active { true }
    sequence(:sort_order) { |n| n.to_i }
  end
end
