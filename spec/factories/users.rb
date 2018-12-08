FactoryGirl.define do
  factory :user, aliases: [:sender] do
    name "agon"
    sequence(:email) {|n| "agon#{n}@agon.com"}
    password "123456"

    trait :accepter do
      name "Vigan"
    end

    trait :with_posts do
    	
    	after(:create) {|user| create_list(:post,5,user: user)}
    end


  end

  
end
