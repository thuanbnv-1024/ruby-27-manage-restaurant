class ApplicationController < ActionController::Base
  before_action :set_locale
  helper_method :current_order

  include SessionHelper

  private

  def current_order
    if session["order_id_#{session[:params_id]}"].nil?
      Order.new
    else
      order = Order.find_by id: session["order_id_#{session[:params_id]}"]
      return order if order

      flash[:danger] = t "dinner_tables.find_order.danger"
      redirect_to root_path
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
