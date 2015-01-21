require 'test_helper'

class EmploysControllerTest < ActionController::TestCase
  setup do
    @employ = employs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employ" do
    assert_difference('Employ.count') do
      post :create, employ: { name: @employ.name, organization_id: @employ.organization_id, phone: @employ.phone, position: @employ.position }
    end

    assert_redirected_to employ_path(assigns(:employ))
  end

  test "should show employ" do
    get :show, id: @employ
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employ
    assert_response :success
  end

  test "should update employ" do
    patch :update, id: @employ, employ: { name: @employ.name, organization_id: @employ.organization_id, phone: @employ.phone, position: @employ.position }
    assert_redirected_to employ_path(assigns(:employ))
  end

  test "should destroy employ" do
    assert_difference('Employ.count', -1) do
      delete :destroy, id: @employ
    end

    assert_redirected_to employs_path
  end
end
