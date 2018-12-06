require 'rails_helper'

RSpec.describe 'as a visitor' do
    describe 'when I click on a book on the book index page' do
        it 'visits the show page' do
            author = Author.create(name:"I am who am")
            book = author.books.create(title: "Life", pages: 42, pub_date: 2018)

            visit '/books'

            click_on ('Life')

            expect(current_path).to eq("/books/#{book.id}")
        end
    end
end