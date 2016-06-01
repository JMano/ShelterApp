module EmployeesHelper
  def count_new_requests
    Request.where(status: 0).size
  end

  def all_requests
    Request.all.order(created_at: :desc)
  end

  def resource_name
    :employee
  end

  def resource
    @resource ||= Employee.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
