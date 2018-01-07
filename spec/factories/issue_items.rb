FactoryBot.define do
  factory :issue_item do
    name { FFaker::Lorem.sentence }
    issue
  end
end
