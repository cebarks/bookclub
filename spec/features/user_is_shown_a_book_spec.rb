require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a book's show page" do
    before(:each) do
      @author1 = Author.create(name: "Sal")
      @book1 = @author1.books.create(title: "The Future", pages: 200, pub_date: "2/2/2022")
      @user1 = User.create(username: "anten")
      @review1 = @book1.reviews.create(title: "Very Futuristic", description: "It came from the future.", rating: 4, user: @user1)

      visit book_path(@book1)
    end
    it "displays the book title, the author(s), and the page count" do
      expect(page).to have_content(@book1.title)
      expect(page).to have_content(@book1.authors.pluck(:name).join(", "))
      expect(page).to have_content(@book1.pages)
      expect(page).to have_content(@book1.pub_date)
    end

    it "displays a list of reviews for the book" do
      expect(page).to have_content(@review1.title)
      expect(page).to have_content(@review1.description)
      expect(page).to have_content(@review1.rating)
    end
  end
end
