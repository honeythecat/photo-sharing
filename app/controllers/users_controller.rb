class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the site!"
      redirect_to "/log-in"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User updated!"
      @user.avatar = nil
      redirect_to "/"
    else
      flash[:notice] = "An error occured!"
      redirect_to "/"
    end
  end

  def show
    @user = User.find(params[:id])
    redirect_to "/"
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
  end
end
