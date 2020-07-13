module TableManageHelper
  def table_badge_show table
    table.using? ? "danger" : "success"
  end

  def table_status_show table
    table.using? ? t("manage_tables.table_on") : t("manage_tables.table_off")
  end
end
