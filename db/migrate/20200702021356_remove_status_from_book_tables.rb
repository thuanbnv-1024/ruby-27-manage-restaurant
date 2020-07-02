class RemoveStatusFromBookTables < ActiveRecord::Migration[6.0]
  def change
    remove_column :book_tables, :status, :integer
  end
end
