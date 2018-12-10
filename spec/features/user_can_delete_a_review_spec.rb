require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit a user's show page" do
    it "shows a delete link next to every review" do
      ian = User.create(username:"ian")
      book = Book.create(title:"test1", pages:666, pub_date: "1/1/1970")
      Review.create(book: book, user: ian, title: "test review", rating: 4, description: "yayyyy")

      visit user_path(ian)

      within("#review-0") do
        click_link 'Delete'
      end

      expect(current_path).to eq(user_path(ian))

      expect(page).to_not have_content(book.title)
      expect(page).to_not have_content(book.pages)
      expect(page).to_not have_content(book.pub_date)
    end
  end
end
