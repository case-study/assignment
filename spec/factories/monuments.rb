FactoryGirl.define do
  factory :monument do
    sequence(:name) { |n| "Monument name #{n}" }
    sequence(:description) { |n| "description #{n}" }
    collection
    user
  end
end
