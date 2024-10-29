FactoryBot.define do
  factory :foul do
    name { "MyString" }
    description { "MyText" }
    is_technical { false }
    active { false }
    sort_order { 1 }
  end
end
