class DinnerTable < ApplicationRecord
  enum status: {free: 0, using: 1}
end
