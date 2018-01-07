FactoryBot.define do
  factory :issue do
    name { FFaker::Lorem.sentence }
    mailing_list
  end
end
