FactoryBot.define do
  factory :play do
    game
    period
    team
    play_action
    player { nil }
    foul { nil }
    game_clock { 1 }
    sort_order { 1 }
    shot_grade { nil }
    shot_type { nil }
    x_coordinate { Faker::Number.decimal(l_digits: 3, r_digits: 10) }
    y_coordinate { Faker::Number.decimal(l_digits: 3, r_digits: 10) }
    canvas_height { Faker::Number.decimal(l_digits: 3, r_digits: 10) }
    canvas_width { Faker::Number.decimal(l_digits: 3, r_digits: 10) }
  end
end
