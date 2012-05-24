FactoryGirl.define do
  factory :post do
    title "7 World Trade Center"
    body "The original 7 World Trade Center was 47 stories tall, clad in red exterior masonry, and occupied a trapezoidal footprint."
  end

  factory :user do
    email "johndoe@example.com"
    password "secret"
    password_confirmation "secret"
  end
end

