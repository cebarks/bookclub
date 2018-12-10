require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I click on a user's name for any book review" do
    it "displays a page of all of that user's reviews" do
      author1 = Author.create(name: "Test")
      book1 = author1.books.create(title:"WOOOOOOOO", pages: 444, pub_date:"1/1/1970")
      book2 = author1.books.create(title:"WEEEEEEEE", pages: 222, pub_date:"1/1/1970")
      book3 = author1.books.create(title:"WUUUUUUUU", pages: 666, pub_date:"1/1/1970")
      user1 = User.create(username: "sal")

      review1 = Review.create(user: user1, book: book1, title: "test review1", description:"Lorem ipsum1.", rating: rand(1..3))
      review2 = Review.create(user: user1, book: book2, title: "test review2", description:"Lorem ipsum2.", rating: rand(1..3))
      review3 = Review.create(user: user1, book: book3, title: "test review3", description:"Lorem ipsum3.", rating: rand(1..3))

      visit user_path(user1)

      expect(page).to have_content(review1.title)
      expect(page).to have_content(review1.description)
      expect(page).to have_content(review2.title)
      expect(page).to have_content(review2.description)
      expect(page).to have_content(review3.title)
      expect(page).to have_content(review3.description)

    end
  end
end
