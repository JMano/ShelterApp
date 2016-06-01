module SessionHelper
  def log_in_employee(employee)
    session[:employee_id] = employee.id
  end

  def current_employee
    @current_employee ||= Employee.find_by(id: session[:employee_id])
  end
end
