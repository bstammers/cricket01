# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
    home_team "MyString"
    away_team "MyString"
    ground "MyString"
    start_date "2014-08-25"
    end_date "2014-08-25"
    competition "MyString"
    grade "MyString"
    umpire1 "MyString"
    umpire2 "MyString"
    scorer1 "MyString"
    scorer2 "MyString"
  end
end
