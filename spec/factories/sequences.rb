FactoryGirl.define do
  sequence :phone do |n|
    13000000000 + n
  end

  sequence(:role_name) { |n| "admin_#{n}" }
end