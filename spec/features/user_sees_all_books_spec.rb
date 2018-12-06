RSpec.describe 'as a user' do 
    describe 'when I visit the book index page' do 
        describe 'for each book' do 
            before(:each) do 
                @author = Author.create(name: "Sal")
                @author2 = Author.create(name: "Ian")

                @book1 = Book.create(title: "Don't use scaffolds", pages: 120, pub_date: "2018", authors: [@author, @author2])
                @book2 = @author.books.create(title:"Say more words", pages: 420, pub_date: "2016")
                @book3 = @author.books.create(title:"Say fewer words", pages: 210, pub_date: "2015")
                @book4 = @author.books.create(title:"Say no words", pages: 0, pub_date: "2014")
                visit books_path
            end 

            it 'displays all the book titles' do 
                expect(page).to have_content(@book1.title)
            end

            it 'displays book authors' do 
                expect(page).to have_content(@book2.authors.pluck(:name).join(', '))
            end 

            it 'displays book page number' do

                within("#book-#{@book3.id}") do 
                    expect(page).to have_content(@book3.pages)
                end 

            end 

            it 'displays publishing year' do
                expect(page).to have_content(@book4.pub_date)
            end 
        end   
    end 
end 