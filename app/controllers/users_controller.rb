class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @users = User.all
    @user = User.find(params[:id])

    if params[:dir] == "asc"
      @reviews = User.find(params[:id]).sort_asc_reviews
    elsif params[:dir] == "dec"
      @reviews = User.find(params[:id]).sort_dec_reviews
    else
      @reviews = @user.review
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end
  # POST /users

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username)
  end
end
