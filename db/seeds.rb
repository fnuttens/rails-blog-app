# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
ArticleToCategory.destroy_all
Category.destroy_all
Article.destroy_all
Author.destroy_all

5.times do
    User.create(name: Faker::Name.first_name)
    User.create(name: Faker::Name.first_name, email: Faker::Internet.email)
end

5.times do
    Author.create(name: Faker::Name.first_name)
end

20.times do
    Article.create(title: Faker::Lorem.word, contents: Faker::Lorem.paragraph_by_chars, author: Author.all.sample)
end

Category.create(name: "Blog")
Category.create(name: "Sport")
Category.create(name: "Science")
Category.create(name: "Music")
Category.create(name: "Cinema")
Category.create(name: "Technology")
Category.create(name: "Politics")
Category.create(name: "Video games")

Article.all.each do |article|
    article.categories << Category.all.sample(Random.rand(3))
end
