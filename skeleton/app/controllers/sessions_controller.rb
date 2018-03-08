class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user_name], params[:password])
    if user
      login!(user)
      flash[:success] = "Successfully logged in!!!"
      redirect_to :cats
    else
      flash[:errors] = "Invalid username/password. BOOOO"
      redirect_to :new_session
    end
  end

  def destroy
    logout!
    flash[:success] = "You have logged out!"
    redirect_to :cats
  end
end
