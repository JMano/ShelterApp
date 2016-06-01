require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employees" do
    assert_difference('Employee.count') do
      post :create, employees: {  }
    end

    assert_redirected_to employee_path(assigns(:employees))
  end

  test "should show employees" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employees" do
    patch :update, id: @employee, employees: {  }
    assert_redirected_to employee_path(assigns(:employees))
  end

  test "should destroy employees" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end
