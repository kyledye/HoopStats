FactoryBot.define do
  factory :play_action do
    play_action_group
    sequence(:name) { |n| "Play Action #{n}" }
    points { 0 }
    requires_coordinates { false }
    requires_fouls { false }
    requires_substitutions { false }
    style { "" }
    active { true }
    sequence(:sort_order) { |n| n }
  end
end
