# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bowler do
    name "MyString"
    overs_bowled 1
    runs 1
    wickets 1
    wides 1
    no_balls 1
    maidens 1
    inning nil
  end
end
