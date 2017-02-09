FactoryGirl.define do
  factory :payment do
    user_id 1
    value "9.99"
    contribution "9.99"
    total "9.99"
    card_number_string "MyString"
  end
end
