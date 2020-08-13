class Department < ApplicationRecord
  DEPARTMENT_PARAMS = %i(name description).freeze

  acts_as_paranoid

  has_many :users, dependent: :destroy

  validates :name, presence: true, uniqueness: {case_sensitive: true},
            length: {maximum: Settings.department.validates.name.max}
  validates :description, presence: true,
            length: {maximum: Settings.department.validates.description.max}
end
