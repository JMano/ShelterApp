module MessagesHelper
  def bootstrap_class_for(flash_type)
    case flash_type
    when "success"
      "alert alert-success"
    when "error"
      "alert.error"
    when "alert"
      "alert-warning"
    end
  end
end
