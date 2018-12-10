require "rails_helper"

RSpec.describe 'as a visitor' do
    describe 'when I click on an author on the author index page' do
        it 'takes me to the show bage for the individual author' do 
            author = Author.create(name:"Michael Jackson")
            
            visit '/authors'

            click_on('Michael Jackson')

            expect(current_path).to eq("/authors/#{author.id}")
        end
    end 
end 
