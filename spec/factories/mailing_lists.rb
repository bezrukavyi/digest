FactoryBot.define do
  factory :mailing_list do
    slug { FFaker::Lorem.word }
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.word }
  end
end
