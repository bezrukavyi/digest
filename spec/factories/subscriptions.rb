FactoryBot.define do
  factory :subscription do
    mailing_list_id { build(:mailing_list, :by_operation).id }
    email { FFaker::Internet.email }

    trait :by_operation do
      initialize_with do
        allow(SubscribeMailJob).to receive(:perform_async)
        Subscriptions::Create.call(params: attributes)[:model]
      end
    end

    trait :invalid do
      email nil
    end
  end
end
