require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'Validations' do
    describe 'Required Fields' do
      it "should be invalid if missing a name" do
        author = Author.create
        expect(author).to_not be_valid
      end
    end
  end
end
