# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :batsman do
    name "MyString"
    balls_faced 1
    fours 1
    sixes 1
    inning nil
  end
end
