puts "Run in 01_create_super_users.rb"

if SuperUser.first.blank?
  super_users = [
    { name: "admin", email: "admin@example.com", password: "admin", is_active: true }
  ]
  super_users.each do |su|
    SuperUser.create(su)
  end
else
  puts "Create super_users finished."
end
