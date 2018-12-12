class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  def show
  end

  # GET /reviews/new
  def new
    if params[:book_id]
      @book = Book.find(params[:book_id])
      @review = Review.new
    else
      @review = Review.new
    end
    # require 'pry'; binding.pry
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    # return render :new if Review.where(review_params[:user_id], review_params[:book_id])
    @review = Review.new(review_params)

    if @review.save
      redirect_to book_path(@review.book), notice: 'Review was successfully created.'
    else
      render :new
    end

  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reviews/1
  def destroy
    review = Review.find(params[:id])
    user = review.user

    review.destroy

    redirect_to user_path(user), notice: 'Review was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    parms = params.require(:review).permit(:title, :description, :rating)
    parms[:user_id] = User.find_or_create_by(username: params[:review][:username]).id
    parms[:book_id] = Book.find_by(title: params[:review][:book]).id
    parms
  end
end
