class ChangeTypeStartTimeInBookTable < ActiveRecord::Migration[6.0]
  def up
    change_column :book_tables, :start_time, :datetime
  end

  def down
    change_column :book_tables, :start_time, :time
  end
end
