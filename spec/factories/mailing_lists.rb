FactoryBot.define do
  factory :mailing_list do
    slug { FFaker::Lorem.word }
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.word }
    user { build :user, :by_operation }
  end

  trait :by_operation do
    initialize_with do
      MailingLists::Create.call(params: attributes, current_user: user)[:model]
    end
  end

  trait :invalid do
    slug nil
  end
end
