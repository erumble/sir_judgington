# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :costume do
    character_name 'Tyrol Ericson'
    property 'I made it up'
    owner
  end
end
