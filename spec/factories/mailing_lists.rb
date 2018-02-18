FactoryBot.define do
  factory :mailing_list do
    slug { FFaker::Lorem.word }
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.word }
  end

  trait :by_operation do
    initialize_with { MailingLists::Create.call(params: attributes)[:model] }
  end

  trait :invalid do
    slug nil
  end
end
