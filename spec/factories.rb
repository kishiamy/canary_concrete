FactoryGirl.define do
  factory :user do
    email "user@user.com"
    group_id 2
  end

  factory :group do
    name "User"
  end
  @user = user.group
end
