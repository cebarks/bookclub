RSpec.describe 'As a Visitor' do 
    describe 'when I visit the user show page' do 
        
        it 'can show the reviews chronologically' do

            asimov = Author.create(name: "Issac Asimov")
            james = Author.create(name: "William James")
            user1 = User.create(username:'u1')
            book1 = Book.create(title: "Varieties of the Religious experience", pages:123, authors:[asimov], pub_date: 2018)
            book2 = Book.create(title: "The Martian", authors:[james], pages:123, pub_date: 1945)
            review1 = user1.review.create(title:"C-razy", description: "no way", rating:4, book:book1)
            review2 = user1.review.create(title:"I cried", description: "yes way", rating:4, book:book2)
            
            visit "/users/#{user1.id}"

            click_link ('Sort (dec)')

            within('#reviews') do
                expect(page).to have_content(review2.title, review1.title)
            end 

            click_link ('Sort (asc)')

            within('#reviews') do
                expect(page).to have_content(review1.title, review2.title)
            end 

        end

    end
end 

            