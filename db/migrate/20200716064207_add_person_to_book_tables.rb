class AddPersonToBookTables < ActiveRecord::Migration[6.0]
  def change
    add_column :book_tables, :person, :integer
  end
end
