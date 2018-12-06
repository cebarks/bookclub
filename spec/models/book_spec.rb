require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'Validations' do
    describe 'Associations' do
      it{should have_many(:reviews)}
      it{should have_many(:book_authors)}
      it{should have_many(:authors).through(:book_authors)}
    end
    describe 'Required Fields' do
      it "should be invalid if missing a title" do
        book = Book.create( pages: 420, pub_date: "12/5/2018")
        expect(book).to_not be_valid
      end

      it "should be invalid if missing pages" do
        book = Book.create(title: "test1", pub_date: "12/5/2018")
        expect(book).to_not be_valid
      end

      it "should be invalid if missing a pub_date" do
        book = Book.create(title: "test1", pages: 420)
        expect(book).to_not be_valid
      end
    end
  end
  describe 'Analytics' do
    it 'should calculate the average rating for a given book' do
        author = Author.create(name:"I am who am")
        book1 = author.books.create(title: "The Bible", pages: 666, pub_date: 50)
        user1 = User.create(username:"99Theses")
        user2 = User.create(username:"JesusLover123")
        review = book1.reviews.create(title:"Twist ending", description: "I didn't see that ressurection thing coming", rating:4, user:user1, book:book1)
        review = book1.reviews.create(title:"Predictable", description: "Totally expected the ending.", rating:2, user:user2, book:book1)
        
        avg_rating = book1.avg_rating
        # require 'pry'; binding.pry

        expect(avg_rating).to eq(3)
    end 
  end
end
