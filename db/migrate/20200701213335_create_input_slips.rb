class CreateInputSlips < ActiveRecord::Migration[6.0]
  def change
    create_table :input_slips do |t|
      t.timestamps
    end
  end
end
