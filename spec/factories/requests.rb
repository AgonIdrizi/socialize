FactoryGirl.define do
  factory :request do
    association :sender
    association :accepter,factory: [:user,:accepter]
  end
end
