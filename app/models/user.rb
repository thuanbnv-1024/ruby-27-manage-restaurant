class User < ApplicationRecord
  belongs_to :department

  enum role: {admin: 0, user: 1, customer: 2}, gender: {man: 0, women: 1}
end
