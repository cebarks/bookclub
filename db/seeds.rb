@@ -6,10 +6,23 @@
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed books and authors
require 'json'
js = JSON.load(File.new("db/books.json"))

author = Author.create(name:"I am who am")
book1 = author.books.create(title: "The Bible", pages: 666, pub_date: 50)
user1 = User.create(username:"99Theses")
user2 = User.create(username:"JesusLover123")
review = book1.reviews.create(title:"Twist ending", description: "I didn't see that ressurection thing coming", rating:4, user:user1, book:book1)
review = book1.reviews.create(title:"Predictable", description: "Totally expected the ending.", rating:2, user:user2, book:book1)
js.each do |book|
  author = book['author']
  author_obj = Author.find_or_create_by(name: author)

  params = {
    title: book['title'],
    pages: book['pages'],
    pub_date: book['year']
  }

  author_obj.books.create(params)

  rand(1..3).times do
    book.reviews.create()
  end
end
