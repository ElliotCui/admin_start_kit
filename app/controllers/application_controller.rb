class ApplicationController < ActionController::Base
  before_action :build_flash
  before_action :check_current_user

  helper_method :current_user

  def current_user
    @current_user ||= SuperUser.find_by_id(session[:super_user]) if session[:super_user]
    return redirect_to login_url unless @current_user

    @current_user
  end

  private

  def build_flash
    return unless params[:flash].present?

    flash.notice ||= params[:flash][:notice]
    flash.alert ||= params[:flash][:alert]

    flash[:success] ||= params[:flash][:success]
    flash[:error] ||= params[:flash][:error]
  end

  def check_current_user
    redirect_to login_url unless current_user
  end
end
