# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name:'Philip Glass', 
			email: 'philipglass@glass.com',
			password: '123456',
			password_confirmation: '123456')

99.times do |n|
  name = Faker::Name.name
  email = "name-#{n+1}@socialize.org"
  password = "password"
  User.create!(name: name,
  			   email: email,
  			   password: password,
  			   password_confirmation: password)
end


#friend_request_sent_relationship
users = User.all
user = users.first
request_sender = users[12..20]
request_accepter = users[22..30]
request_sender.each do |sender| 
  request_accepter.each do |accepter|
    sender.friend_requests_sent_relationship.create(accepter_id: accepter.id)
  end
end

#friendship_relationship
friendship_friends = users[2..10]
user_friends = users[12..20]
friendship_friends.each do |friend|
  user_friends.each do |user|
    friend.friends_relationship.create(user_id: user.id)
  end
end

# Create posts
users = users[1..11]

	
users.each do |user|
  3.times do
    body = Faker::GreekPhilosophers.quote
    user.posts.create(body: body)
  end
end
users = users[3..13]
# Create likes for posts
posts = Post.all.take(30)
posts.each do |post|
  users.each do |user|
  	post.likes.create(user_id: user.id)
  end
end


# Create comments for posts
posts = Post.all.take(30)
posts.each do |post|
  3.times do 
  	
  	body = Faker::Lorem.paragraph(2)
  	post.comments.create(body: body,user_id: rand(3..10))
  end
end