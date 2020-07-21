module ApplicationHelper
  STATUS = {pending: "warning", checked: "info", received: "primary", success: "success", cancel: "danger"}

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

  def status_book_table book_table_status
    "label label-#{STATUS[book_table_status.to_sym]}"
  end
end
