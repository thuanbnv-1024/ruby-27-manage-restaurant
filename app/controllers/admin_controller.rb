class AdminController < ActionController::Base
  before_action :authenticate_admin_user!, :set_locale, :signed_customer

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def signed_customer
    return unless current_admin_user&.customer?

    flash[:danger] = t "sign_ups.notredirect"
    redirect_to root_path
  end
end
