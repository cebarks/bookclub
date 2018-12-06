require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit the book index page' do
    describe 'it can sort the books by' do
      before(:each) do
        @book1 = Book.create(title: "book1", pages: 666, pub_date: "12/12/2012")
        @book2 = Book.create(title: "book2", pages: 666, pub_date: "12/12/2012")
        @book3 = Book.create(title: "book3", pages: 666, pub_date: "12/12/2012")
        @book4 = Book.create(title: "book4", pages: 666, pub_date: "12/12/2012")
        @book5 = Book.create(title: "book5", pages: 666, pub_date: "12/12/2012")
        @book6 = Book.create(title: "book6", pages: 666, pub_date: "12/12/2012")
        @book1.reviews.create(title: "book1 review", description:"a", rating: 5)
        @book2.reviews.create(title: "book2 review", description:"a", rating: 1)
      end

      describe "average rating by" do
        it "ascending order" do
          visit "/books?sort=rating&dir=asc"
        end

        it "descending order" do
          visit "/books?sort=rating&dir=des"
        end
      end

      describe "number of pages by" do
        it "ascending order" do
          visit "/books?sort=pages&dir=asc"
        end

        it "descending order" do
          visit "/books?sort=pages&dir=des"
        end
      end

      describe "number of reviews by" do
        it "ascending order" do
          visit "/books?sort=reviews&dir=asc"
        end

        it "descending order" do
          visit "/books?sort=reviews&dir=des"
        end
      end
    end
  end
end
