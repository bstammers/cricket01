# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :over do
    runs 1
    wides 1
    no_balls 1
    byes 1
    leg_byes 1
    wickets 1
    score "MyString"
    bowler nil
  end
end
