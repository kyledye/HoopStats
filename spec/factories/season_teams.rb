FactoryBot.define do
  factory :season_team do
    season
    team
    active { true }
  end
end
