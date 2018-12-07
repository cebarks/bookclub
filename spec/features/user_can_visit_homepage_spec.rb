require "rails_helper"

RSpec.describe 'As a visitor' do 
    
    describe "when I visit the index page" do 
        it "displays a navigation bar" do 
            visit '/books'
            
            expect(page).to have_css('#nav_bar')
        end 
        
        it 'can link to the book index' do 
            visit '/books'
            
            within('#nav_bar') do
                click_link('Books')
            end 
            expect(current_path).to eq('/books')
        end 
        
        it 'can link to the author index' do 
            visit '/books'

            within('#nav_bar') do
                click_link('Authors')
            end 

            expect(current_path).to eq('/authors')
        end 

    end 

end 