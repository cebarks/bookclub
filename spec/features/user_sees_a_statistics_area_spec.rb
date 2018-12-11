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

      it 'shows the top 3 authors' do
        within('.top-3-authors') do
          expect(page).to have_content(Book.top_3_books.pluck(:name).join(", "))
        end
      end
    end
  end
end
