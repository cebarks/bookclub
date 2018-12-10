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


asimov = Author.create(name: "Issac Asimov")
james = Author.create(name: "William James")
user1 = User.create(username:'u1')
book1 = Book.create(title: "Varieties of the Religious experience", pages:123, authors:[asimov], pub_date: 2018)
book2 = Book.create(title: "The Martian", authors:[james, asimov], pages:123, pub_date: 1945)
review1 = user1.review.create(title:"C-razy", description: "no way", rating:4, book:book1)
review2 = user1.review.create(title:"I cried", description: "yes way", rating:4, book:book2)
