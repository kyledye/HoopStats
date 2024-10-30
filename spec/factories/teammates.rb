FactoryBot.define do
  factory :teammate do
    season_team
    player
    sequence(:jersey_number) { |n| n }
    active { true }
  end
end
