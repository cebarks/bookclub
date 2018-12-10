require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "if submit a review for a book as a user who already has one" do
    it "won't let me" do
      user = User.create(username: "test")
      book = Book.create(title: "test1", pages: 666, pub_date: "1/1/1970")

      Review.create(user: user, book: book, title: "test2", description: "lorem 2 ipsum", rating: 3)
      Review.create(user: user, book: book, title: "test3", description: "lorem 3 ipsum", rating: 3)

      visit user_path(user)

      expect(page).to_not have_content("test3")
      expect(page).to_not have_content("lorem 3 ipsum")
      expect(page).to have_content("test2")
      expect(page).to have_content("lorem 2 ipsum")
    end
  end
end
