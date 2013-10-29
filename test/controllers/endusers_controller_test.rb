require 'test_helper'

class EndusersControllerTest < ActionController::TestCase
  setup do
    @enduser = endusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:endusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enduser" do
    assert_difference('Enduser.count') do
      post :create, enduser: { address: @enduser.address, dateofbirth: @enduser.dateofbirth, empno: @enduser.empno, firstname: @enduser.firstname, lastname: @enduser.lastname }
    end

    assert_redirected_to enduser_path(assigns(:enduser))
  end

  test "should show enduser" do
    get :show, id: @enduser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enduser
    assert_response :success
  end

  test "should update enduser" do
    patch :update, id: @enduser, enduser: { address: @enduser.address, dateofbirth: @enduser.dateofbirth, empno: @enduser.empno, firstname: @enduser.firstname, lastname: @enduser.lastname }
    assert_redirected_to enduser_path(assigns(:enduser))
  end

  test "should destroy enduser" do
    assert_difference('Enduser.count', -1) do
      delete :destroy, id: @enduser
    end

    assert_redirected_to endusers_path
  end
end
