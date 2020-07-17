class StaticPagesController < ApplicationController
  def index
    @book_tables = BookTable.new
  end
end
