class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  def index
    if params[:sort]
      return Book.all unless params[:dir] == 'asc' || params[:dir] == 'desc'
      @books = case params[:sort]
      when 'rating' then Book.sort_by_average_rating(params[:dir])
      when 'pages' then Book.sort_by_pages(params[:dir])
      when 'reviews' then Book.sort_by_reviews(params[:dir])
      end
    else
      @books = Book.all
    end
  end

  # GET /books/1
  def show
    @book = Book.find(params[:id])
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.create!(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /books/1
  def destroy
    @book.reviews.each(&:destroy)
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    parms = params.require(:book).permit(:title, :pages, :pub_date, :authors)
    new_authors = params[:book][:author].split(", ").map do |name|
      Author.find_or_create_by(name: name.titleize)
    end
    parms[:authors] = new_authors
    parms[:title] = parms[:title].titleize
    parms
  end
end
