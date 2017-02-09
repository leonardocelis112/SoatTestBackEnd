FactoryGirl.define do
  factory :vehicle_subtype do
    name Faker::Name.name
    value 203_100
    commercial_rate 8.26
    code '110'
    vehicle_class
  end
end
