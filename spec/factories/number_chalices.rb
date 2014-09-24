# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :number_chalice do
    exhibition 1
    hot_or_bulky 1
    regular 1
    contest nil
  end
end
