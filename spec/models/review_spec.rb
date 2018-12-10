require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'Validations' do
    describe 'Associations' do
      it {should belong_to(:user)}
      it {should belong_to(:book)}
      # it {should validate_uniqueness_of(:user_id)}
      # it {should validate_uniqueness_of(:book_id)}
    end
    describe 'Required Fields' do
      it "should be invalid if missing a title" do
        review = Review.create(title:"", )
        expect(review).to_not be_valid
      end
    end
  end
end
