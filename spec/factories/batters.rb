# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :batter do
    name "MyString"
    runs 0
    balls_faced 0
    fours 0
    sixes 0
    how_out "MyString"
    bowler "MyString"
    ball_history "MyString"
    inning nil
  end
end
