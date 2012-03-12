FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "secret"
#  f.sequence(:email) { |n| "#{n}@example.com" }
#  f.password "secret"
  end
  
  factory :user, :group => :user do
    admin true
  end
end

FactoryGirl.define Group do 
#  factory group do
    name "admins"
end
