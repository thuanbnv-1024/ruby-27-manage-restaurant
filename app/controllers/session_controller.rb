class SessionController < ActionController::Base
  include SessionHelper

  def index; end

  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user.try(:authenticate, params[:session][:password])
      log_in user
      redirect_to root_url
    else
      flash[:danger] = t "login_fail"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
