# Factories for user class
FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
    telephone Faker::PhoneNumber.cell_phone
    document_number Faker::Number.number(10)
    document_type "Cedula"
    password Faker::Internet.password
    email Faker::Internet.email
  end
end
