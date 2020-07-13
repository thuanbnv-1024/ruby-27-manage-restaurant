module ApplicationHelper
  def show_errors form_builder, field_name
    object = form_builder.object
    return unless object.errors.any?

    return if object.errors.messages[field_name].blank?

    [t("errors.user.#{field_name}"),
      object.errors.messages[field_name].join(", ")].join(" ")
  end

  def errors_textfield form_builder, field_name
    object = form_builder.object
    return if object.errors.blank?

    object.errors.messages[field_name].present? ? "errors_textfield" : ""
  end
end
