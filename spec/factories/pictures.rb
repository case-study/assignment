FactoryGirl.define do
  factory :picture do
    sequence(:name) { |n| "Picture name #{n}" }
    sequence(:description) { |n| "description #{n}" }
    taken_on { Date.today }
    monument
  end
end
