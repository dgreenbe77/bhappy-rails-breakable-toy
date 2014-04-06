FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "abc_#{n}@example.com" }
    password "adminqwerty"
  end

  factory :info do
    main_post "hi"
    address "10 lakeville drive, boston, ma 02184"
    association :user, factory: :user
  end
  
end
