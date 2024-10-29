FactoryBot.define do
  factory :shot_grade do
    name { "A" }
    description { "" }
    made_multiplier { "1.00" }
    missed_multiplier { "0.85" }
    score { 4 }
    active { true }
    sort_order { 1 }
  end
end
