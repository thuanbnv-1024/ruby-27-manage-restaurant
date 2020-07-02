class AddStatusToDinnerTables < ActiveRecord::Migration[6.0]
  def change
    add_column :dinner_tables, :status, :integer, null: false, default: 0
  end
end
