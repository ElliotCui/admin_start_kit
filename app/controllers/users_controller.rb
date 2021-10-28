class UsersController < ApplicationController
  def index
    @users = User
    @users = @users.where(gender: params[:gender].to_i) if params[:gender].present?
    @users = @users.paginate(page: params[:page], per_page: 20).order('id DESC')
  end

  def special
    @users = User.where(gender: User::FEMALE).paginate(page: params[:page], per_page: 20).order('id DESC')
  end
end
