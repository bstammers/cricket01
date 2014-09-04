# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inning do
    inning_no 2
    batting_team "MyString"
    bowling_team "MyString"
    score "MyString"
    match 1
  end
end
