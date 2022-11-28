class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(login_id: params[:session][:login_id].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid loginID/password combination' 
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
