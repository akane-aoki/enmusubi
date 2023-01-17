FactoryBot.define do
  factory :post do
    body { "MyString" }
    date { "2023-01-16" }
    image { "MyString" }
    user { nil }
  end
end
