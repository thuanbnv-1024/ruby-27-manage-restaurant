class RemoveStatusFromDinnerTables < ActiveRecord::Migration[6.0]
  def change
    remove_column :dinner_tables, :status, :integer
  end
end
