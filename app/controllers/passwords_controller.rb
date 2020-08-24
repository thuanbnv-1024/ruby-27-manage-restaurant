class PasswordsController < Devise::PasswordsController
  before_action :check_password_token_invalid, only: :edit

  def edit
    super
  end

  private

  def check_password_token_invalid
    param_token = Devise.token_generator.digest(self, :reset_password_token, params[:reset_password_token])
    user = User.find_by reset_password_token: param_token
    return if user

    flash[:danger] = t "reset_pass.password_changed"
    redirect_to root_path
  end
end
