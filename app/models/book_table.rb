class BookTable < ApplicationRecord
  belongs_to :user

  enum status: {pending: 0, success: 1}
end
