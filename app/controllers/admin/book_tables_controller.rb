class Admin::BookTablesController < AdminController
  before_action :load_book_table, only: %i(update edit)

  def index
    @book_tables = BookTable.sort_status.page(params[:page]).per(Settings.dishes.per_page)
  end

  def edit; end

  def update
    if @book_table.update book_table_params
      flash[:success] = t "dishes.update_success"
      redirect_to admin_book_tables_path
    else
      flash[:danger] = t "dishes.update_error"
      render :edit
    end
  end

  private

  def book_table_params
    params.require(:book_table).permit BookTable::BOOK_TABLE_PARAMS
  end

  def load_book_table
    @book_table = BookTable.find_by id: params[:id]
    return if @book_table

    flash[:danger] = t "dish_types.not_found"
    redirect_to admin_book_tables_path
  end
end
