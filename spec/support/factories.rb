FactoryGirl.define do
  factory :user do |u|
    u.password                { "testing" }
    u.password_confirmation   { "testing" }
    u.email                   { Faker::Internet.email }
    u.group        { |group| group.association(:group) }
  end
  factory :admin, :parent => :user do |a|
    a.password                  "adminadmin" 
    a.password_confirmation     "adminadmin" 
    a.email                   { Faker::Internet.email }
    a.group        { |group| group.association(:group_admin) }
  end

  factory :group do |g|
   g.name "Client"
  end
  factory :group_admin, :parent => :group  do |g|
   g.name "Admin"
  end
end
