class AddUserRefToInputSlips < ActiveRecord::Migration[6.0]
  def change
    add_reference :input_slips, :user, null: false, foreign_key: true
  end
end
