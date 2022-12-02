# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
names = %w[Leo Andres Matias Angel Lisandro Reem Nicolas Melanie Kyrillos Fernando]
generate_lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
title = %w[Gossip Chat Blog Rails Ruby Milestone Portfolio]
first_user = User.create(name: 'Tom',
                         photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxM[…]G90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly',
                          photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxM[…]G90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', bio: 'Teacher from Poland.')
names.each { |item| User.create(name: item, photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxM[…]G90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', bio: generate_lorem) }

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Hello', text: 'This is my second post')
third_post = Post.create(author: first_user, title: 'Hello', text: 'This is my third post')
fourth_post = Post.create(author: first_user, title: 'Hello', text: 'This is the fourth post')
(0..25).each do |_item|
  Post.create(author: User.find(rand(1..12)), title: title[rand(6)], text: generate_lorem)
end

Comment.create(post: first_post, author: second_user, text: 'Hi Lisandro!')
Comment.create(post: first_post, author: second_user, text: 'Hi Sahar!')
Comment.create(post: first_post, author: second_user, text: 'Hi Andres!')
Comment.create(post: first_post, author: second_user, text: 'Hi Nicolas!')
Comment.create(post: first_post, author: second_user, text: 'Hi Reem!')
Comment.create(post: first_post, author: second_user, text: 'Hi Other People!')
(1..20).each do |_item|
  Comment.create(post: Post.find(rand(1..30)), author: User.find(rand(1..12)),
                 text: generate_lorem)
end

Like.create(post: Post.first, author: User.first)
Like.create(post: Post.second, author: User.first)
Like.create(post: Post.third, author: User.second)
Like.create(post: Post.fourth, author: User.first)
(1..30).each do |_item|
  Like.create(post: Post.find(rand(1..30)), author: User.find(rand(1..12)))
end