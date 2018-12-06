class BookAuthorsController < ApplicationController
  before_action :set_book_author, only: [:show, :edit, :update, :destroy]

  # GET /book_authors
  def index
    @book_authors = BookAuthor.all
  end

  # GET /book_authors/1
  def show
  end

  # GET /book_authors/new
  def new
    @book_author = BookAuthor.new
  end

  # GET /book_authors/1/edit
  def edit
  end

  # POST /book_authors
  def create
    @book_author = BookAuthor.new(book_author_params)

    if @book_author.save
      redirect_to @book_author, notice: 'Book author was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /book_authors/1
  def update
    if @book_author.update(book_author_params)
      redirect_to @book_author, notice: 'Book author was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /book_authors/1
  def destroy
    @book_author.destroy
    redirect_to book_authors_url, notice: 'Book author was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book_author
    @book_author = BookAuthor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_author_params
    params.require(:book_author).permit(:has_many, :has_many)
  end
end
