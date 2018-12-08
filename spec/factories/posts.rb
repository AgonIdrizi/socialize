FactoryGirl.define do
  factory :post do
    body "hey hey hey hey hey" 
    association :user

    trait :with_like do
      after(:create) { |post| create(:like,likeable: post)}
    end
  end
end
