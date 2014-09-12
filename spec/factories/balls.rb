# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ball do
    over_ball "MyString"
    runs 1
    how_out "MyString"
    caught_by "MyString"
    striker "MyString"
    non_striker "MyString"
    sundries 1
    sundries_type "MyString"
    location "MyString"
    over nil
  end
end
