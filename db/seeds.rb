# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# User.populate 20 do |user|
#   user.name = Faker::Name.name
#   user.email = Faker::Internet.email
#   user.encrypted_password = User.new(password: "password").encrypted_password
# end

writer = User.create!(email: "writer@example.org",
                      username: "writer",
                      password: "password123",
                      encrypted_password: User.new(password: "password123").encrypted_password)

junior = User.create!(email: "junior@example.org",
                      username: "junior",
                      password: "password123",
                      encrypted_password: User.new(password: "password123").encrypted_password)

Post.create!(user: writer,
             title: "Hot Day",
             content: "The sun seems to like me very much these days.
I don't really mind, but I really wish it could love someone else too.")

Post.create!(user: junior,
             title: "Hello!",
             content: "Hey! I'm pretty new here! Glad to be here!
This is my first time here, so please be nice to me (and each other).")