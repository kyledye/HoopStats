FactoryBot.define do
  factory :game do
    association :season
    association :team
    association :opponent
    date_time { "2024-10-28 19:14:49" }
    number_of_periods { 4 }
    allow_overtime { true }
    period_length { 8 }
    overtime_length { 4 }
    is_away { false }
    is_closed { false }
    current_lineup { "MyText" }
    counts_against_record { false }
  end
end
