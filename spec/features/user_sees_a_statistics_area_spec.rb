require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When you visit the book index page' do
    describe 'it has a statistics area' do
      before(:each) do
        visit books_path
      end

      it 'exists' do
        expect(page).to have_css('#statistics')
      end

    end
  end
end
