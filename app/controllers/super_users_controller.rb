class SuperUsersController < ApplicationController
  def index
    @super_users = SuperUser.paginate(page: params[:page], per_page: 20).order('id DESC')
  end

  def new
    @super_user = SuperUser.new(super_user_params)
  end

  def create
    params[:super_user][:is_active] ||= false
    @super_user = SuperUser.new(super_user_params)

    if @super_user.save
      redirect_to action: 'index', flash: { success: "创建成功！" }
    else
      render "new", params: super_user_params, flash: { error: @super_user.errors.full_messages[0] }
    end
  end

  def edit
    @super_user = SuperUser.find(params[:id])
  end

  def update
    params[:super_user][:is_active] ||= false

    @super_user = SuperUser.find(params[:id])
    @super_user.update_attributes(super_user_params)

    redirect_to action: 'index', flash: { success: "创建成功！" }
  end

  def show
    @super_user = SuperUser.find(params[:id])
  end

  def destroy
    redirect_to action: 'index', flash: { success: "删除成功！" }
  end

  def reset_password
    super_user = SuperUser.find(params[:id])
    password = super_user.reset_password

    if password
      flash[:success] = "重置密码成功，新的密码为 #{password}"
    else
      flash[:alert] = "重置密码失败，请重试，再次失败请联系后台工程师"
    end

    redirect_to super_user_path(super_user)
  end

  private

  def super_user_params
    return {} unless params[:super_user]

    params.require(:super_user).permit(:name, :email, :is_active, :password, :password_confirmation)
  end
end
