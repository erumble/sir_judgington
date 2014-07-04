# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    contest_date '2014-07-03'
    skill_level 4
    hot_or_bulky false
    group_name 'Trouble Makers'
  end
end
