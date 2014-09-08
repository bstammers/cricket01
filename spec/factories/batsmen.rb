# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :batsman do
    name "MyString"
    runs 1
    balls_faced 1
    fours 1
    sixes 1
    how_out "MyString"
    ball_history "MyString"
    inning nil
  end
end
