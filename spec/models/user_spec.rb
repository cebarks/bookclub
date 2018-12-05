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
end
