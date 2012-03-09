Factory.define :user do |f|
  f.sequence(:email) { |n| "#{n}@example.com" }
  f.password "secret"
end
Factory.define :group do |g|
  g.name "admins"
end
