# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
    home_team "MyString"
    away_team "MyString"
    ground "MyString"
    start_date "25-08-2014"
    end_date "25-08-2014"
    competition "MyString"
    grade "MyString"
    umpire1 "MyString"
    umpire2 "MyString"
    scorer1 "MyString"
    scorer2 "MyString"
  end
  
  factory :invalid_match_home, parent: :match do
    home_team nil
  end
  factory :invalid_match_away, parent: :match do
    away_team nil
  end
end
