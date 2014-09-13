FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@sample.com" }
    password 'test@#$1234'
  end
end
