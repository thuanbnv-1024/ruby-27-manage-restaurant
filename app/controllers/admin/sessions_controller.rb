class Admin::SessionsController < Devise::SessionsController
  layout "session"

  protected

  def after_sign_in_path_for _admin
    return root_path if current_admin_user.customer?

    admin_root_path
  end
end
