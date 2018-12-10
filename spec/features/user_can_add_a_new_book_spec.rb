require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit the book index page" do
    it "I can click a link to create a new book" do
      title = "YAYYYY"
      authors = "ian, sal"
      pages = 666
      pub_date = "1/1/1970"

      Author.create(name:"ian")
      Author.create(name:"sal")

      visit books_path

      click_link "Add Book"

      expect(current_path).to eq(new_book_path)

      fill_in "book[title]", with: title
      fill_in "book[pages]", with: pages
      fill_in "book[author]", with: authors
      fill_in "book[pub_date]", with: pub_date

      click_button 'Create Book'

      expect(current_path).to eq(book_path(Book.last))
      expect(page).to have_content(title.titleize)
      expect(page).to have_content(authors.titleize)
      expect(page).to have_content(pages)
      expect(page).to have_content(pub_date)
    end
  end
end
