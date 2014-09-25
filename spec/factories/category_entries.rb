# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category_entry do
    category
    entry

    factory :valid_category_entry do
      after(:build || :create) do |category_entry|
        category_entry.entry.contest.categories << category_entry.category
      end
    end
  end
end
