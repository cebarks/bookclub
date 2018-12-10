require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a book's show page" do
    it "i can delete the book" do
      book1 = Book.create(title: "Bible", pages: 666, pub_date: "12/12/2012")
      visit book_path(book1)

      click_link('Delete')

      expect(current_path).to eq(books_path)

      expect(page).to_not have_content(book1.title)
      expect(page).to_not have_content(book1.pages)
      expect(page).to_not have_content(book1.pub_date)
    end
  end
end
