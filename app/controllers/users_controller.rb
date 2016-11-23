class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    # @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User added successfuly !!!"
      redirect_to @user
    else
      flash[:error] = "Something goes wrong"
      redirect_to action: :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
