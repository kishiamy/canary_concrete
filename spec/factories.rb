FactoryGirl.define do
  factory :user do
    password "secret"
    sequence (:email) {|n| "person#{n}@example.com"}
  end
  
  factory :group do
    name "admin"
  end
end

