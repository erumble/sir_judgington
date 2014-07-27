# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contestant, aliases: [:owner] do
    first_name 'John'
    last_name 'Smith'
    phonetic_spelling 'John Smith'
    email 'john.smith@example.com'
  end
end
