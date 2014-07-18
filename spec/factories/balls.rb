# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ball do
    runs 1
    how_out "MyString"
    caught_by "MyString"
    striker "MyString"
    non_striker "MyString"
    sundries_type "MyString"
    sundries_amt 1
    shot_location "MyString"
    bowler nil
    over nil
  end
end
