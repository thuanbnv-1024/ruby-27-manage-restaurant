class RemoveBirthdayFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :birthday, :string
  end
end
