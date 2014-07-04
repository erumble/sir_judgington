# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :costume do
    character_name "MyString"
    property "MyString"
    contestant nil
  end
end
