# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    skill_level 4
    hot_or_bulky false
    group_name 'Trouble Makers'
    handler_count 2
    contest
    judging_time nil

    factory :entry_with_invalid_judging_time do
      judging_time

      factory :entry_with_valid_judging_time do
        after(:build || :create) do |entry|
          entry.contest.judging_times << entry.judging_time
        end
      end
    end

  end
end
