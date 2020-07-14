class Admin::UsersController < AdminController
  before_action :find_user, only: :show

  def index
    @users = User.includes(:department).page(params[:page]).per Settings.users.per
  end

  def show; end

  def new
    @user = User.new
    @department = Department.all
  end

  def create
    @user = User.create params_user
    respond_to :js
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t ".find_user.danger"
    redirect_to root_path
  end

  def params_user
    params.require(:user).permit User::USER_PARAMS
  end
end
