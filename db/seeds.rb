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

30.times do
  User.create(username: Faker::Artist.name)
end

# Seed books and authors
require 'json'
require 'faker'
js = JSON.load(File.new("db/books.json"))

js.each do |book|
  author = book['author']
  author_obj = Author.find_or_create_by(name: author)

  params = {
    title: book['title'],
    pages: book['pages'],
    pub_date: book['year']
  }

  book_obj = author_obj.books.create(params)

  rand(1..3).times do
    book_obj.reviews.create(title: Faker::FamousLastWords.last_words, description: Faker::Lorem.paragraph, rating:rand(1..5), user: User.offset(rand(User.count)).first)
  end
end
