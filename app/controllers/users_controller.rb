class UsersController < ApplicationController
  def index
    # @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_in @user
      flash[:success] = 'User added successfuly !!!'
      redirect_to @user
    else
      flash[:error] = 'Something goes wrong'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
  end

  private

    def user_params
      params.require(:user).permit(:name,
                                   :email,
                                   :password,
                                   :password_confirmation)
    end
end
