class RemoveStatusFromDishes < ActiveRecord::Migration[6.0]
  def change
    remove_column :dishes, :status, :boolean
  end
end
