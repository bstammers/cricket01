# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :batsman do
    runs 1
    balls_faced 1
    fours 1
    sixes 1
    how_out 1
    inning nil
  end
end
