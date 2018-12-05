require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'Validations' do
    describe 'Associations' do
      it{should have_many(:reviews)}
      it{should have_many(:book_authors)}
      it{should have_many(:authors).through(:book_authors)}
    end
    describe 'Required Fields' do
      it "should be invalid if missing a title" do
        book = Book.create( pages: 420, pub_date: "12/5/2018")
        expect(book).to_not be_valid
      end

      it "should be invalid if missing pages" do
        book = Book.create(title: "test1", pub_date: "12/5/2018")
        expect(book).to_not be_valid
      end

      it "should be invalid if missing a pub_date" do
        book = Book.create(title: "test1", pages: 420)
        expect(book).to_not be_valid
      end
    end
  end
end
