FactoryGirl.define do
  factory :user do
    name "MyString"
    email { Faker::Internet.email }
  end
end
