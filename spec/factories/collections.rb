FactoryGirl.define do
  factory :collection do
    sequence(:name) { |n| "Name #{n}" }
    user
  end
end
