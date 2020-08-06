class Admin::SessionsController < Devise::SessionsController
  layout "session"

  private

  def after_sign_out_path_for _admin
    new_admin_user_session_path
  end

  def after_sign_in_path_for _admin
    return root_path if current_admin_user&.customer?

    admin_root_path
  end
end
