# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cosplay do
    person
    character
    entry
  end
end
