FactoryBot.define do
  factory :user do
    first_name 'John'
    sequence(:last_name) { |n| "Doe #{n}" }
  end
end
