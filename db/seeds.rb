# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all
User.destroy_all
Category.destroy_all

Post.reset_pk_sequence
User.reset_pk_sequence
Category.reset_pk_sequence

User.create(username: "Chenyun", email:"abc123@abc.com", password: "abc123")

5.times do
    User.create(
        username: Faker::Name.unique.name,
        email: Faker::Internet.email,
        password: "abc123"
    )
end

Category.create(title: "Game")
Category.create(title: "Movie")
Category.create(title: "Music")
Category.create(title: "Question")
Category.create(title: "Entertainment")
Category.create(title: "General")
Category.create(title: "TV")

5.times do
    Post.create(title: Faker::Lorem.question, content:Faker::Lorem.paragraph, user: User.all[rand(0..4)], category: Category.all[rand(0..4)])
end
