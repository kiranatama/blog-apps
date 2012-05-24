FactoryGirl.define do
  factory :post do
    title "7 World Trade Center"
    body "The original 7 World Trade Center was 47 stories tall, clad in red exterior masonry, and occupied a trapezoidal footprint."
  end

  factory :user do
    username "johndoe"
    email "johndoe@example.com"
    password "password"
    password_confirmation "password"
  end
end

