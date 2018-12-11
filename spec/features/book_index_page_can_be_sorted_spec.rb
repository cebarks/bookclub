require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit the book index page" do
    before(:each) do
      @author = Author.create!(name: "test")
      @user = User.create!(username: "ian")
      @user2 = User.create!(username: "sal")

      @book1 = @author.books.create!(title: "book1", pages: 666, pub_date: "1/1/1970")
      @book2 = @author.books.create!(title: "book2", pages: 555, pub_date: "1/1/1970")
      Review.create!(book: @book1, user: @user, title:"5", description:"5", rating:5)
      Review.create!(book: @book2, user: @user, title:"1", description:"1", rating: 1)
      Review.create!(book: @book1, user: @user2, title:"5", description:"5", rating: 5)


    end

    it "should be sortable by average rating" do
      visit "#{books_path}?sort=rating&dir=asc"
      expect(all('.book')[0]).to have_content(@book2.title)
      expect(all('.book')[1]).to have_content(@book1.title)
      visit "#{books_path}?sort=rating&dir=desc"
      expect(all('.book')[0]).to have_content(@book1.title)
      expect(all('.book')[1]).to have_content(@book2.title)
    end

    it "should be sortable by number of pages" do
      visit "#{books_path}?sort=pages&dir=asc"
      expect(all('.book')[0]).to have_content(@book2.title)
      expect(all('.book')[1]).to have_content(@book1.title)
      visit "#{books_path}?sort=pages&dir=desc"
      expect(all('.book')[0]).to have_content(@book1.title)
      expect(all('.book')[1]).to have_content(@book2.title)
    end

    it "should be sortable by reviews" do
      visit "#{books_path}?sort=reviews&dir=asc"
      expect(all('.book')[0]).to have_content(@book2.title)
      expect(all('.book')[1]).to have_content(@book1.title)
      visit "#{books_path}?sort=reviews&dir=desc"
      expect(all('.book')[0]).to have_content(@book1.title)
      expect(all('.book')[1]).to have_content(@book2.title)
    end
  end
end
