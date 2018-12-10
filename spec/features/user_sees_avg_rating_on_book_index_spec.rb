RSpec.describe "when a user visits the book index page they" do
    it 'can see the average book rating' do
        author = Author.create(name:"I am who am")
        book1 = author.books.create(title: "The Bible", pages: 666, pub_date: 50)
        user1 = User.create(username:"99Theses")
        user2 = User.create(username:"JesusLover123")
        review = book1.reviews.create(title:"Twist ending", description: "I didn't see that ressurection thing coming", rating:4, user:user1, book:book1)
        review = book1.reviews.create(title:"Predictable", description: "Totally expected the ending.", rating:2, user:user2, book:book1)

        visit books_path

        #fixme: needs to be fixed to check for css  
            expect(find(".ui.star.rating")['data-rating']).to eq('3.0')
    end
end