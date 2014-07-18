# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
    home_team "MyString"
    away_team "MyString"
    ground "MyString"
    start_date "2014-07-18"
    end_date "2014-07-18"
    competition "MyString"
    umpire1 "MyString"
    umpire2 "MyString"
  end
end
