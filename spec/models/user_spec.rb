require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    describe 'Associations' do
      it{should have_many(:review)}
    end

    describe 'Required Fields' do
      it "should be invalid if missing a username" do
        user = User.create
        expect(user).to_not be_valid
      end
    end
  end

  describe 'Analytics' do 
    it 'can sort reviews' do 
      user1 = User.create(username:'u1')
      asimov = Author.create(name: "Issac Asimov")
      james = Author.create(name: "William James")
      book1 = Book.create(title: "Varieties of the Religious experience", pages:123, authors:[asimov], pub_date: 2018)
      book2 = Book.create(title: "The Martian", authors:[james], pages:123, pub_date: 1945)
      review1 = user1.review.create(title:"C-razy", description: "no way", rating:4, book:book1)
      review2 = user1.review.create(title:"I cried", description: "yes way", rating:4, book:book2)
      example1 = [review1, review2]
      example2 = [review2, review1]

      expect(user1.sort_dec_reviews).to eq(example2)
      expect(user1.sort_asc_reviews).to eq(example1)
    end 
  end
end
