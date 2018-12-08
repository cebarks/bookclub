RSpec.describe 'As a Visitor' do 
    describe 'when I visit the user show page' do
        asimov = Author.create(name: "Issac Asimov")
        james = Author.create(name: "William James")
        user1 = User.create(username:'u1')
        book1 = Book.create(title: "Varieties of the Religious experience", authors:[asimov], pub_date: 2018)
        book1 = Book.create(title: "The Martian", authors:[james], pub_date: 1945)
        review1 = user1.review.create(title:"Twist ending", description: "no way", rating:4, book:book1)
        review2 = user1.review.create(title:"Predictable", description: "yes way", rating:2, book:book1)

        it 'can show the reviews chronologically' do
            visit '/reviews'
        
            click_on ('sort (dec)')

            within('#reviews') do
                expect(page).to have_content(review2, review1)
            end 

            click_on ('sort (asc)')

            within('#reviews') do
                expect(page).to have_content(review1, review2)
            end 

        end

    end
end 

            