FactoryBot.define do
  factory :auth_provider do
    uid { FFaker::Lorem.word }
    name { AuthProvider.names.keys.sample }
    resource { build(:user, :by_operation) }

    trait :by_operation do
      initialize_with { AuthProviders::Create.call(params: attributes)[:model] }
    end
  end
end
