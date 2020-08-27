require "bcrypt"

class PreviouspasswordValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    current_user = User.find_by email: record.email
    return unless current_user

    bcrypt = ::BCrypt::Password.new(current_user.encrypted_password)
    hashed_value = ::BCrypt::Engine.hash_secret([value, Devise.pepper].join, bcrypt.salt)
    return unless hashed_value == current_user.encrypted_password

    record.errors[attribute] << I18n.t("regex.password.previous_message")
  end
end
