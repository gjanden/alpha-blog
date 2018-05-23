class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    #@article.user = User.first
    if @user.save
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to articles_path
    else
      render :new
    end
  end

  def show

  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
