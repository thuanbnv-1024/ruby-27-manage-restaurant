class Admin::TableManageController < AdminController
  def index
    @table_manage = DinnerTable.page(params[:page]).per Settings.manage_tables.per_page
  end
end
