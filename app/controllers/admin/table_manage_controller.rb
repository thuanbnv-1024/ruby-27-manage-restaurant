class Admin::TableManageController < AdminController
  def index
    @table_manage = DinnerTable.filter_status(params[:option_status])
                               .page(params[:page])
                               .per Settings.manage_tables.per_page
  end
end
