class ApplicationController < ActionController::Base
  layout :layout

  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def custom_user_auth
    unless employee_signed_in?
      redirect_to :new_employee_session
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(
        :name,
        :email,
        :phone,
        :address,
        :birth_date,
        :password,
        :password_confirmation,
        :notifications_phone,
        :notifications_email)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(
        :name,
        :phone,
        :address,
        :birth_date,
        :password,
        :password_confirmation,
        :current_password,
        :notifications_phone,
        :notifications_email)
    end
  end

  def custom_admin
    unless current_employee.admin
      redirect_to :employees
    end
  end

  def layout
    # (devise_controller? || is_a?(EmployeesController)) || is_a?(ShelterController ) ? 'employees' : 'users'
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    if is_a?(StaticPagesController) || (is_a?(RequestsController) && action_name == "new")
      "users"
    else
      "employees"
    end
  end

  def after_sign_in_path_for(_resource)
    "/employees"
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource)
    new_employee_session_path
  end
end
