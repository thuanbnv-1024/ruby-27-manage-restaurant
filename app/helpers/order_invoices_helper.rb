module OrderInvoicesHelper
  STATUS = {complete: "success", processing: "danger"}.freeze

  def options_for_payment_methods
    Order.payment_methods.keys.map do |key|
      [t("order.#{key}"), key]
    end
  end

  def load_status_order order_status
    "badge badge-#{STATUS[order_status.to_sym]}"
  end

  def list_table_numbers
    DinnerTable.order_by_table_numnber.map do |table|
      [t("order.table") << " #{table.table_number}", table.table_number]
    end
  end

  def order_status
    Order.statuses.keys.map do |key|
      [t("order.#{key}"), key]
    end
  end
end
