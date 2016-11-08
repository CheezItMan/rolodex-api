require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :ok
  end

  test "should get show" do
    get :show, {id: contacts(:one).id}
    assert_response :ok
  end

  test "should get update" do
    put :update, {id: contacts(:one).id, name: "bob", email: "bob@hope.com", tel: "111-111-1111", avatar: "http://placecage.com/300/300"}
    assert_response :success
  end

  test "should get create" do
    post :create, {name: "bob", email: "bob@hope.com", tel: "111-111-1111", avatar: "http://placecage.com/300/300"}
    assert_response :success
  end

  test "should get delete" do
    delete :destroy, {id: contacts(:one).id}
    assert_response :success
  end

end
