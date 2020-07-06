class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      flash[:success] = t "users.active.active_success"
    else
      flash[:danger] = t "users.active.active_fail"
    end
    redirect_to root_path
  end
end
