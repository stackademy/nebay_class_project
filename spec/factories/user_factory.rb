FactoryGirl.define do
  factory :user do |f|
    email { generate(:email) }
    password "12345678"
    password_confirmation "12345678"
  end

  sequence :email do |n|
    "somebody#{n}@example.com"
  end
end