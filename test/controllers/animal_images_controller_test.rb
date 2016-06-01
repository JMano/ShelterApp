require 'test_helper'

class AnimalImagesControllerTest < ActionController::TestCase
  setup do
    @animal_image = animal_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:animal_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create animal_image" do
    assert_difference('AnimalImage.count') do
      post :create, animal_image: { animal_id: @animal_image.animal_id, images: @animal_image.images }
    end

    assert_redirected_to animal_image_path(assigns(:animal_image))
  end

  test "should show animal_image" do
    get :show, id: @animal_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @animal_image
    assert_response :success
  end

  test "should update animal_image" do
    patch :update, id: @animal_image, animal_image: { animal_id: @animal_image.animal_id, images: @animal_image.images }
    assert_redirected_to animal_image_path(assigns(:animal_image))
  end

  test "should destroy animal_image" do
    assert_difference('AnimalImage.count', -1) do
      delete :destroy, id: @animal_image
    end

    assert_redirected_to animal_images_path
  end
end
