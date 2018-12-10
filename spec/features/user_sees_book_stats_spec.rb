require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When i visit a book show page' do
    describe 'it has a statistics area for the reviews' do
      before(:each) do
        @author1 = Author.create(name: "Sal")
        @book1 = @author1.books.create(title: "The Future", pages: 200, pub_date: "2/2/2022")
        @user1 = User.create(username: "anten")
        @review1 = @book1.reviews.create(title: "Very Futuristic1", description: "It came from the future1.", rating: 5, user: @user1)
        @review2 = @book1.reviews.create(title: "Very Futuristic2", description: "It came from the future2.", rating: 5, user: @user1)
        @review3 = @book1.reviews.create(title: "Very Futuristic3", description: "It came from the future3.", rating: 4, user: @user1)
        @review4 = @book1.reviews.create(title: "Very Futuristic4", description: "It came from the future4.", rating: 3, user: @user1)
        @review5 = @book1.reviews.create(title: "Very Futuristic5", description: "It came from the future5.", rating: 2, user: @user1)
        @review6 = @book1.reviews.create(title: "Very Futuristic6", description: "It came from the future6.", rating: 2, user: @user1)
        @review7 = @book1.reviews.create(title: "Very Futuristic7", description: "It came from the future7.", rating: 1, user: @user1)

        visit book_path(@book1)
      end

      it "shows the top three reviews" do
        within("#top-3-reviews") do
          expect(page).to have_content(@review1.title)
          expect(page).to have_content(@review2.title)
          expect(page).to have_content(@review3.title)
        end
      end

      it "shows the bottom three reviews " do
        within("#bottom-3-reviews") do
          expect(page).to have_content(@review5.title)
          expect(page).to have_content(@review6.title)
          expect(page).to have_content(@review7.title)
        end
      end

      it "shows the overall average rating of all reviews" do
        within("#average-review") do 
          expect(page).to have_content("3")
        end
      end
    end
  end
end
