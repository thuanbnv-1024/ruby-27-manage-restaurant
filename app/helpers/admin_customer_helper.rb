module AdminCustomerHelper
  def customer_badge_show customer
    customer.active? ? "success" : "danger"
  end

  def customer_status_show customer
    customer.active? ? t("admin_customer.active") : t("admin_customer.not_active")
  end
end
