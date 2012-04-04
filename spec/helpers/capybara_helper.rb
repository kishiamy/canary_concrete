include Warden::Test::Helpers
Warden.test_mode!

FactoryGirl.define do
  factory :user do
    email "user@user.com"
    group_id 2
  end
end

FactoryGirl.define do
  factory :group do
    name "User"
  end
end
Warden.test_reset!
