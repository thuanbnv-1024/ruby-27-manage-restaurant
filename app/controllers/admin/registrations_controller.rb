class Admin::RegistrationsController < Devise::RegistrationsController
  layout :dynamic_layout

  def new
    @departments = Department.pluck :name, :id
    super
  end

  def edit
    @departments = Department.pluck :name, :id
    super
  end

  private

  def after_sign_up_path_for _admin
    return root_path if current_admin_user.customer?

    admin_root_path
  end

  def after_update_path_for _admin
    return user_path(current_admin_user) if current_admin_user.customer?

    admin_user_path current_admin_user
  end

  def dynamic_layout
    if current_admin_user.nil? || current_admin_user.customer?
      "application"
    else
      "admin"
    end
  end

  def update_resource resource, params
    return super if params["password"]&.present?

    resource.update_without_password(params.except("current_password"))
  end
end
