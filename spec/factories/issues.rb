FactoryBot.define do
  factory :issue do
    name { FFaker::Lorem.sentence }
    release_at { rand(1..100).days.ago }
    published { [true, false].sample }
    mailing_list_id { build(:mailing_list, :by_operation).id }

    trait :invalid do
      name nil
    end
  end
end
