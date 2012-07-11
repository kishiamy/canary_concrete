# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Groups = {
  admin: Group.find_or_create_by_name("Admin"),
  client: Group.find_or_create_by_name("Client")
}

# Create the example user only when there is no data
if User.count == 0
  User.new.tap do |user|
    user.email = "admin@admin.com"
    user.password = "adminadmin"
    user.group = Groups[:admin]
    user.save!
  end
end

if Page.count == 0
  Page.new.tap do |page|
    page.title = "Index"
    page.content = "this web don't have content please edit this web and edit the content"
    page.save!
  end
end
