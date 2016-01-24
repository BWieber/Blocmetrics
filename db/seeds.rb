
5.times do
  user = User.create!(
    username:     Faker::Name.first_name,
    email:        Faker::Internet.email,
    password:     Faker::Internet.password,
    confirmed_at: Time.now
  )
end
users = User.all

# Create applications
20.times do
  RegisteredApplication.create!(
    user:  users.sample,
    name:  Faker::App.name,
    url:   Faker::Internet.url
  )
end
applications = RegisteredApplication.all

50.times do
  Event.create!(
  name:  Faker::Company.name,
  registered_application: applications.sample,
  created_at: rand(10.years).seconds.ago
  )
events = Event.all
end

# Create an admin user
admin = User.create!(
    username: 'Admin',
    email:    'admin@example.com',
    password: 'helloworld',
    confirmed_at: Time.now,
)

usul = User.create!(
    username: 'Usul',
    email:    'usul@arrakis.com',
    password: 'helloworld',
    confirmed_at: Time.now,
    )


puts "Seed finished"
puts "#{User.count} users created."
puts "#{RegisteredApplication.count} applications created."
puts "#{Event.count} events created."
