class BookTablesController < ApplicationController
  before_action :check_login, only: :create
  include SessionHelper

  def index; end

  def new; end

  def create
    @book_table = current_user.book_table.build book_table_params
    if @book_table.save
      flash[:success] = t "book_tables.create_success"
    else
      flash[:danger] = t "book_tables.create_error"
    end
    redirect_to root_path
  end

  private

  def book_table_params
    params.require(:book_table).permit BookTable::BOOKTABLE_PARAMS
  end

  def check_login
    return if logged_in

    redirect_to login_path
  end
end
