FactoryGirl.define do
  factory :user do
    phone { generate(:phone).to_s }
    sequence(:name) { |n| "User #{n}" }
    password "111111"
  end
end
