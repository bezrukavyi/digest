FactoryBot.define do
  factory :issue_item do
    description { FFaker::Lorem.sentence }
    source { FFaker::Lorem.word }
    title { FFaker::Lorem.word }
    issue

    trait :with_link do
      after(:create) do |issue_item|
        create :link, issue_item: issue_item
      end
    end

    trait :invalid do
      description nil
    end
  end
end
