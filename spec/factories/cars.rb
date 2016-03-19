FactoryGirl.define do
  factory :car do
    user_id 1
    brand_id 1
    model_no "MyString"
    color "MyString"
    distance 1.5
    on_time "2016-03-19"
    description "MyText"
    car_type 1
  end
end
