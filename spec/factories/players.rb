# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    first_name "MyString"
    last_name "MyString"
    full_name "MyString"
    display_name "MyString"
    team "MyString"
    cricketer nil
  end
end
