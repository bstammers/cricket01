# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inning do
    batting_team "MyString"
    bowling_team "MyString"
    innings_no 1
    score "MyString"
    match nil
  end
end
