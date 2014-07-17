# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :judging_time do
    sequence(:time) { |n| "Time_#{n}" }
  end
end
