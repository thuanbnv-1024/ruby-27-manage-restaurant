class PasswordregexValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    return if value =~ Settings.regex.password_regex

    record.errors[attribute] << (options[:message] || I18n.t("regex.password.message"))
  end
end
