class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :check_current_user

  layout "sessions"

  def create
    super_user    = SuperUser.find_by_email(params[:email])
    login_status  = super_user.authenticate?(params[:password])

    if login_status
      session[:super_user] = super_user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:super_user] = nil
    redirect_to login_url, notice: "Logged out!"
  end
end
