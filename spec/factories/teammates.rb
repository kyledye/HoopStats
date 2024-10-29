FactoryBot.define do
  factory :teammate do
    season_team
    player
    sequence(:jersey_number) { |n| n.to_i }
    active { true }
  end
end
