module BookTablesHelper
  def options_status
    BookTable.statuses.keys.map do |key|
      [t("book_tables.#{key}"), key]
    end
  end

  def load_status_book_table book_table_status
    badge = {
      pending: "warning",
      checked: "info",
      received: "primary",
      success: "success",
      cancel: "danger"
    }
    "badge badge-#{badge[book_table_status.to_sym]}"
  end
end
