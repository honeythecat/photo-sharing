class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "You are logged in In!  Who Cares?"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem logging you in hahahah."
      redirect_to "/log-in"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been logged out successfully"
    redirect_to "/users/new"
  end
end
