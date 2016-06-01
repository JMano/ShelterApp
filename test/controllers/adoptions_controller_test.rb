require 'test_helper'

class AdoptionsControllerTest < ActionController::TestCase
  setup do
    @adoption = adoptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adoptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adoption" do
    assert_difference('Adoption.count') do
      post :create, adoption: { date: @adoption.date, description: @adoption.description, end_date: @adoption.end_date, photo: @adoption.photo, type: @adoption.type }
    end

    assert_redirected_to adoption_path(assigns(:adoption))
  end

  test "should show adoption" do
    get :show, id: @adoption
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adoption
    assert_response :success
  end

  test "should update adoption" do
    patch :update, id: @adoption, adoption: { date: @adoption.date, description: @adoption.description, end_date: @adoption.end_date, photo: @adoption.photo, type: @adoption.type }
    assert_redirected_to adoption_path(assigns(:adoption))
  end

  test "should destroy adoption" do
    assert_difference('Adoption.count', -1) do
      delete :destroy, id: @adoption
    end

    assert_redirected_to adoptions_path
  end
end
