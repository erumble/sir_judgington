# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contest do
    date Date.parse '27-09-2014'

    factory :contest_with_categories do
      ignore do
        category_count 3
      end

      after(:create) do |contest, evaluator|
        contest.categories << create_list(:category, evaluator.category_count)
      end
    end
  end

end
