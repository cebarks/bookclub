# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


author = Author.create(name:"I am who am")
book1 = author.books.create(title: "The Bible", pages: 666, pub_date: 50)
user1 = User.create(username:"99Theses")
user2 = User.create(username:"JesusLover123")
review = book1.reviews.create(title:"Twist ending", description: "I didn't see that ressurection thing coming", rating:4, user:user1, book:book1)
review = book1.reviews.create(title:"Predictable", description: "Totally expected the ending.", rating:2, user:user2, book:book1)
