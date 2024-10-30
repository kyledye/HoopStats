FactoryBot.define do
  factory :play_action_group do
    name { "MyString" }
    is_pinned { false }
    active { true }
    sequence(:sort_order) { |n| n }
  end
end
