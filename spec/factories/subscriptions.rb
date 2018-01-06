FactoryBot.define do
  factory :subscription do
    mailing_list
    email { FFaker::Internet.email }
  end
end
