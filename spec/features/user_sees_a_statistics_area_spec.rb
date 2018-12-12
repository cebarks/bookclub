require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When you visit the book index page' do
    describe 'it has a statistics area' do
      before(:each) do
        visit books_path
      end

      it 'exists' do
        expect(page).to have_css('#statistics')
      end

      it 'shows the top 3 books' do
        author = Author.create(name:"I am who am")
        author2 = Author.create(name:"Malcolm X")
        author3 = Author.create(name:"David Brower")
        author4 = Author.create(name:"Harvey Milk")

        book1 = author.books.create(title: "The Bible", pages: 666, pub_date: 50)
        book2 = author2.books.create(title:"plymoth rock", pages: 10, pub_date: 1960)
        book3 = author3.books.create(title:"Save the Canyon", pages: 10, pub_date: 1950)
        book4 = author4.books.create(title:"I'm here to stay ", pages: 10, pub_date: 1980)
        user1 = User.create(username:"99Theses")
        user2 = User.create(username:"JesusLover123")
        user3 = User.create(username:"ReligiousAtheist")
        user4 = User.create(username:"AntisocialExtrovert")
        review1 = book1.reviews.create(title:"Twist ending", description: "I didn't see that ressurection thing coming", rating:4, user:user1, book:book1)
        review2 = book2.reviews.create(title:"Predictable", description: "Totally expected the ending.", rating:4, user:user2, book:book2)
        review3 = book3.reviews.create(title:"I'm conflicted", description:"I both loved and hated it", rating:4, user:user3, book:book3)
        review4 = book4.reviews.create(title:"I'd love to talk about it", description:"But not with you", rating:1, user:user4, book:book4)

        visit books_path

        within('#top-3-books') do
          expect(page).to have_content(book1.title)
          expect(page).to have_content(book2.title)
          expect(page).to have_content(book3.title)
          expect(page).to_not have_content(book4)
        end
      end

      it 'shows the top 3 authors' do 
        author = Author.create(name:"I am who am")
        author2 = Author.create(name:"Malcolm X")
        author3 = Author.create(name:"David Brower")
        author4 = Author.create(name:"Harvey Milk")

        book1 = author.books.create(title: "The Bible", pages: 666, pub_date: 50)
        book2 = author2.books.create(title:"plymoth rock", pages: 10, pub_date: 1960)
        book3 = author3.books.create(title:"Save the Canyon", pages: 10, pub_date: 1950)
        book4 = author4.books.create(title:"I'm here to stay ", pages: 10, pub_date: 1980)
        user1 = User.create(username:"99Theses")
        user2 = User.create(username:"JesusLover123")
        user3 = User.create(username:"ReligiousAtheist")
        user4 = User.create(username:"AntisocialExtrovert")
        review1 = book1.reviews.create(title:"Twist ending", description: "I didn't see that ressurection thing coming", rating:4, user:user1, book:book1)
        review2 = book2.reviews.create(title:"Predictable", description: "Totally expected the ending.", rating:4, user:user2, book:book2)
        review3 = book3.reviews.create(title:"I'm conflicted", description:"I both loved and hated it", rating:4, user:user3, book:book3)
        review4 = book4.reviews.create(title:"I'd love to talk about it", description:"But not with you", rating:1, user:user4, book:book4)
        
        visit books_path

        within('#top-3-authors') do
          expect(page).to have_content(book1.authors.first.name)
          expect(page).to have_content(book2.authors.first.name)
          expect(page).to have_content(book3.authors.first.name)
          expect(page).to_not have_content(book4)
        end

      end
    end
  end
end
