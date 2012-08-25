FactoryGirl.define do
  factory :user do |u|
    u.password                { "testing" }
    u.password_confirmation   { "testing" }
    u.email                   { Faker::Internet.email }
    u.group        { |group| group.association(:group) }
    u.approved      false
  end
  factory :admin, :parent => :user do |a|
    a.password                  "adminadmin" 
    a.password_confirmation     "adminadmin" 
    a.email                     { Faker::Internet.email } 
    a.approved      true
    a.group        { |group| group.association(:group_admin) }
  end

  factory :group do |g|
   g.name "Client"
  end
  factory :group_admin, :parent => :group  do |g|
   g.name "Admin"
  end
  factory :page do |p|
    p.title      "index"
    p.content    "page index"
    p.page_id    nil
  end
end
