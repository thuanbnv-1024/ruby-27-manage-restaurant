class NumberintValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    return if value =~ Settings.regex.number_int

    record.errors[attribute] << (options[:message] || I18n.t("regex.number.message"))
  end
end
