class RemoveForeignKeyFromUser < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :department_id, :bigint, null: true
  end
end
