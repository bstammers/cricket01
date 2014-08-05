# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fall_of_wicket do
    wicket 1
    batsman_out "MyString"
    batsman_not_out "MyString"
    partnership 1
    inning nil
  end
end
