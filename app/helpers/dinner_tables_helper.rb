module DinnerTablesHelper
  def status_dinner_tabel val
    val.free? ? t("dinner_tables.free") : t("dinner_tables.using")
  end
end
