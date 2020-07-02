class AddUserToBookTables < ActiveRecord::Migration[6.0]
  def change
    add_reference :book_tables, :user, null: false, foreign_key: true
  end
end
