FactoryGirl.define do
  factory :post do
    title "WTC Facts"
    body "The original WTC was 47 stories tall, clad in red exterior masonry, and occupied a trapezoidal footprint."
  end

  factory :user do
    email "johndoe@example.com"
    password "secret"
    password_confirmation "secret"
  end
end

