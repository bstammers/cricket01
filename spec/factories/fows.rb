# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fow do
    wicket 1
    batsman_out "MyString"
    batsman_in "MyString"
    partnership 1
    inning nil
  end
end
