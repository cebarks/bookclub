require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit a book's show page" do
    it "shows a link that allows me to create a new review" do
      author = Author.create!(name: "sal")
      book = author.books.create!(title: "book1", pages: 66, pub_date: "1/1/1970")

      visit book_path(book)

      click_link 'Add Review'

      expect(current_path).to eq(new_review_path)

      title = "Weeeee"
      username = "ian"
      description = "wooooooo"

      # save_and_open_page

      fill_in "review[title]", with: title
      fill_in "review[username]", with: username
      fill_in "review[description]", with: description
      fill_in "review[book]", with: book.title
      select 4, from: 'review_rating'

      click_button 'Create Review'

      expect(current_path).to eq(book_path(book))
      expect(page).to have_content(title)
      expect(page).to have_content(username)
      expect(page).to have_content(description)
    end
  end
end
