module ApplicationHelper
  def show_errors form_builder, field_name
    return unless form_builder.object.errors.any?
    if form_builder.object.errors.messages[field_name].present?
      [t("errors.user.#{field_name}"), form_builder.object.errors.messages[field_name].join(", ")].join(" ")
    end
  end

  def errors_textfield form_builder, field_name
    return if form_builder.object.errors.blank?
    form_builder.object.errors.messages[field_name].present? ? "errors_textfield" : ""
  end
end
