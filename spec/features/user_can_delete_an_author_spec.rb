require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit an author's show page" do
    it "theres a link that deletes the author" do
      author1 = Author.create(name: "Sal")
      author2 = Author.create(name: "Ian")

      book1 = Book.create(title: "The Future", pages: 200, pub_date: "2/2/2022", authors: [author1])
      book2 = Book.create(title: "The 2 Future", pages: 400, pub_date: "4/4/4044", authors: [author1, author2])

      visit author_path(author1)

      click_link('Delete')

      expect(current_path).to eq(books_path)

      save_and_open_page

      expect(page).to_not have_content(book1.title)
      expect(page).to_not have_content(book1.pages)
      expect(page).to_not have_content(book1.pub_date)
      expect(page).to have_content(book2.title)
      expect(page).to have_content(book2.pages)
      expect(page).to have_content(book2.pub_date)
    end
  end
end
