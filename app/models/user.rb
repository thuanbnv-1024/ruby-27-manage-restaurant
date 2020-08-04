class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_paranoid

  belongs_to :department, optional: true
  has_many :book_tables, dependent: :destroy

  delegate :name, to: :department, prefix: :department

  enum gender: {man: 0, women: 1}, role: {customer: 0, admin: 1, waiters: 2, receptionists: 3, chef: 4}

  VALID_EMAIL_REGEX = Settings.email_regex
  PERMIT_ATTRIBUTES = %i(name email password password_confirmation address
    birthday phone gender).freeze
  USER_PARAMS = %i(name email address phone birthday role
    department_id gender password password_confirmation).freeze
  CUSTOMER_UPDATE_PARAMS = %i(name address phone birthday gender
    password password_confirmation).freeze

  attr_accessor :activation_token

  before_save :downcase_email

  validates :name, :email, :address, :phone,
            :birthday, presence: true

  validates :name, length: {maximum: Settings.user.name.max_length}
  validates :address, length: {maximum: Settings.user.address.max_length}
  validates :phone, numericality: true,
    length: {minimum: Settings.user.phone.min_length, maximum: Settings.user.phone.max_length}
  validates :password, length: {minimum: Settings.user.password.min_length}, allow_nil: true

  private

  def downcase_email
    email.downcase!
  end
end
