FactoryBot.define do
  factory :user do
    after(:build, &:skip_confirmation_notification!)
    after(:create, &:confirm)

    email { FFaker::Internet.email }
    password { SecureRandom.hex(16) }
    password_confirmation { password }

    trait :by_operation do
      initialize_with { Users::Create.call(params: attributes)[:model] }
    end
  end
end
