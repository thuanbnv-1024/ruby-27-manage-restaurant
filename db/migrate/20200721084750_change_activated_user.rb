class ChangeActivatedUser < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :activated, :tinyint, default: 0
  end
end
