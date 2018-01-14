FactoryBot.define do
  factory :link do
    url { FFaker::Internet.http_url }
    issue_item
  end
end
