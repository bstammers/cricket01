# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bowler do
    overs 4
    runs 7
    wickets 1
    wides 2
    no_balls 3
    maidens 0
    inning nil
  end
end
