require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit an author's show page" do
    it "it displays one of the higest rated reviews" do
      author = Author.create(name: "test")
      book = author.books.create(title:"test1", pages:666, pub_date:"1/1/1970")
      review1 = Review.create(book: book, user: User.create(username:"ian"), title:"asd", description:"asd", rating: 1)
      review2 = Review.create(book: book, user: User.create(username:"sal"), title:"asd2", description:"asd2", rating: 5)

      visit author_path(author)

      within("#top-review") do
        expect(page).to have_content(review2.title)
        expect(page).to have_content(review2.description)
      end
    end
  end
end
