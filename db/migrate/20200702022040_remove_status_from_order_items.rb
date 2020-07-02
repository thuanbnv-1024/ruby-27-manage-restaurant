class RemoveStatusFromOrderItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_items, :status, :boolean
  end
end
