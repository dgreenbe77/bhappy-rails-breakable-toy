FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "abc_#{n}@example.com" }
    password "adminqwerty"
  end

  factory :info do
    health 5
    wealth 3
  end
  # factory :blog do
  #   title "Moderation Pays Off for a Far-Right Party in France"
  #   url "http://www.nytimes.com/2014/04/02/world/europe/moderation-pays-off-for-a-far-right-party-in-france.html?hp&_r=0"
  #   association :user, factory: :user
  # end

end
