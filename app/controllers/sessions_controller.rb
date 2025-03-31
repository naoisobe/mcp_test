class SessionsController < ApplicationController
  def new
    redirect_to root_path if user_signed_in?
  end
  
  def create
    user = AuthenticationService.login(params[:email], params[:password])
    
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully!'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end
  
  def destroy
    AuthenticationService.logout(session)
    redirect_to root_path, notice: 'Logged out successfully!'
  end
end
