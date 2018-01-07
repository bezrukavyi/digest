FactoryBot.define do
  factory :subtitle do
    name { FFaker::Book.title }
    issue
  end
end
