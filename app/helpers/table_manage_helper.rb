module TableManageHelper
  def table_badge_show table
    table.using? ? "danger" : "success"
  end

  def table_status_show table
    table.using? ? t("table_manage.table_on") : t("table_manage.table_off")
  end
end
