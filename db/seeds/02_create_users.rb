puts "Run in 02_create_users.rb"

if User.first.blank?
  users = [
    { name: "female_user", email: "female_user@example.com", gender: User::FEMALE },
    { name: "male_user", email: "male_user@example.com", gender: User::MALE }
  ]
  users.each do |u|
    User.create(u)
  end
else
  puts "Create users finished."
end
