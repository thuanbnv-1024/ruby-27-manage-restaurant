module CartsHelper
  def load_order_status dish
    dish.success? ? t("order_items.index.success") : t("order_items.index.pending")
  end
end
