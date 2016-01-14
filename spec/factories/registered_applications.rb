FactoryGirl.define do
  factory :registered_application do
    
    name Faker::Internet.name
    url  Faker::Internet.url
    user
  end

end
