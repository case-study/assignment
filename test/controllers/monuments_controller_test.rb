require 'test_helper'

class MonumentsControllerTest < ActionController::TestCase
  setup do
    @monument = monuments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monuments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monument" do
    assert_difference('Monument.count') do
      post :create, monument: { description: @monument.description, name: @monument.name }
    end

    assert_redirected_to monument_path(assigns(:monument))
  end

  test "should show monument" do
    get :show, id: @monument
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monument
    assert_response :success
  end

  test "should update monument" do
    patch :update, id: @monument, monument: { description: @monument.description, name: @monument.name }
    assert_redirected_to monument_path(assigns(:monument))
  end

  test "should destroy monument" do
    assert_difference('Monument.count', -1) do
      delete :destroy, id: @monument
    end

    assert_redirected_to monuments_path
  end
end
