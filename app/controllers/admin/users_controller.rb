class Admin::UsersController < AdminController
  before_action :find_user, only: %i(edit update destroy)
  before_action :load_departments, only: %i(index new edit)

  def index
    @users = User.includes(:department).page(params[:page]).per Settings.users.per
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.create params_user
    respond_to :js
  end

  def edit; end

  def update
    @user.update params_user
    respond_to :js
  end

  def destroy
    @user.destroy
  end

  private

  def load_departments
    @departments = Department.all
  end

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
