require 'test_helper'

class User2sControllerTest < ActionController::TestCase
  setup do
    @user2 = user2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user2" do
    assert_difference('User2.count') do
      post :create, user2: { cell_phone: @user2.cell_phone, city: @user2.city, fax: @user2.fax, home_phone: @user2.home_phone, name: @user2.name, state: @user2.state, street: @user2.street, zip: @user2.zip }
    end

    assert_redirected_to user2_path(assigns(:user2))
  end

  test "should show user2" do
    get :show, id: @user2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user2
    assert_response :success
  end

  test "should update user2" do
    patch :update, id: @user2, user2: { cell_phone: @user2.cell_phone, city: @user2.city, fax: @user2.fax, home_phone: @user2.home_phone, name: @user2.name, state: @user2.state, street: @user2.street, zip: @user2.zip }
    assert_redirected_to user2_path(assigns(:user2))
  end

  test "should destroy user2" do
    assert_difference('User2.count', -1) do
      delete :destroy, id: @user2
    end

    assert_redirected_to user2s_path
  end
end
