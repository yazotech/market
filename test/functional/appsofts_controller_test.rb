require 'test_helper'

class AppsoftsControllerTest < ActionController::TestCase
  setup do
    @appsoft = appsofts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appsofts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appsoft" do
    assert_difference('Appsoft.count') do
      post :create, :appsoft => @appsoft.attributes
    end

    assert_redirected_to appsoft_path(assigns(:appsoft))
  end

  test "should show appsoft" do
    get :show, :id => @appsoft.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @appsoft.to_param
    assert_response :success
  end

  test "should update appsoft" do
    put :update, :id => @appsoft.to_param, :appsoft => @appsoft.attributes
    assert_redirected_to appsoft_path(assigns(:appsoft))
  end

  test "should destroy appsoft" do
    assert_difference('Appsoft.count', -1) do
      delete :destroy, :id => @appsoft.to_param
    end

    assert_redirected_to appsofts_path
  end
end
