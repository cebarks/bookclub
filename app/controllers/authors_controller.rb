class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  # GET /authors
  def index
    @authors = Author.all
  end

  # GET /authors/1
  def show
    @author = Author.find(params[:id])
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors
  def create
    @author = Author.new(author_params)

      if @author.save
        redirect_to @author, notice: 'Author was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /authors/1
  def update
      if @author.update(author_params)
        redirect_to @author, notice: 'Author was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /authors/1
  def destroy
    author = Author.find(params[:id])
    author.books.each do |book|
      book.destroy unless book.authors.length > 1
    end
    author.destroy
    redirect_to books_url, notice: 'Author was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:name)
    end
end
