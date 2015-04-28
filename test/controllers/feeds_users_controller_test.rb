require 'test_helper'

class FeedsUsersControllerTest < ActionController::TestCase
  setup do
    @feeds_user = feeds_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feeds_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feeds_user" do
    assert_difference('FeedsUser.count') do
      post :create, feeds_user: {  }
    end

    assert_redirected_to feeds_user_path(assigns(:feeds_user))
  end

  test "should show feeds_user" do
    get :show, id: @feeds_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feeds_user
    assert_response :success
  end

  test "should update feeds_user" do
    patch :update, id: @feeds_user, feeds_user: {  }
    assert_redirected_to feeds_user_path(assigns(:feeds_user))
  end

  test "should destroy feeds_user" do
    assert_difference('FeedsUser.count', -1) do
      delete :destroy, id: @feeds_user
    end

    assert_redirected_to feeds_users_path
  end
end
