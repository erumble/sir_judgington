# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contestant do
    first_name 'John'
    last_name 'Smith'
    email 'john.smith@example.com'
  end
end
