class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i(facebook)

  acts_as_paranoid

  belongs_to :department, optional: true
  has_many :book_tables, dependent: :destroy

  delegate :name, to: :department, prefix: :department

  enum gender: {man: 0, women: 1},
    role: {admin: 0, waiters: 1, customer: 2, receptionists: 3, chef: 4},
    activated: {not_active: 0, active: 1}

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
  validates :phone, numericality: true, numberint: true,
    length: {minimum: Settings.user.phone.min_length, maximum: Settings.user.phone.max_length}
  validates :password, length: {minimum: Settings.user.password.min_length},
            allow_nil: true, passwordregex: true, previouspassword: true

  class << self
    def new_with_session params, session
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end

    def from_omniauth auth
      auth_user = User.find_by email: auth.info.email
      return auth_user if auth_user

      omniauth_user auth
    end

    def omniauth_user auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.name = auth.info.name
        user.password = Devise.friendly_token[0, 20]
      end
    end
  end

  private

  def downcase_email
    email.downcase!
  end
end
