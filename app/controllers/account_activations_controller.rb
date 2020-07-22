class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if user&.not_active? && user&.authenticated?(:activation, params[:id])
      user.active!
      flash[:success] = t "users.active.active_success"
    else
      flash[:danger] = t "users.active.active_fail"
    end
    redirect_to root_path
  end
end
