class BookTable < ApplicationRecord
  BOOKTABLE_PARAMS = %i(start_time user_id person).freeze
  belongs_to :user

  enum status: {pending: 0, success: 1}
end
