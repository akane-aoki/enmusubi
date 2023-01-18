FactoryBot.define do
  factory :reward do
    not_meet_day { 1 }
    content { "MyString" }
    relationship { nil }
  end
end
