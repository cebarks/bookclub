require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I visit an authors show page' do
    describe "for all books by that author" do
      before(:each) do
        @author = Author.create(name: "Sal")
        @author2 = Author.create(name: "Ian")
        
        @book1 = Book.create(title: "Don't use scaffolds", pages: 120, pub_date: "2018", authors: [@author, @author2])
        @book2 = @author.books.create(title:"Say more words", pages: 420, pub_date: "2016")

        visit author_path(@author)
      end

      it "displays title" do
        expect(page).to have_content(@book1.title)
        expect(page).to have_content(@book2.title)
      end

      it "displays year" do
        expect(page).to have_content(@book1.pub_date)
        expect(page).to have_content(@book2.pub_date)
      end

      it "displays page count" do
        expect(page).to have_content(@book1.pages)
        expect(page).to have_content(@book2.pages)
      end

      it "displays any additional authors" do
        expect(page).to have_content("Other Authors: #{(@book1.authors.pluck(:name) - [@author.name]).join(", ")}")
      end
    end
  end
end
