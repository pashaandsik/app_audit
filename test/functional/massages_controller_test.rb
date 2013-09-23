require 'test_helper'

class MassagesControllerTest < ActionController::TestCase
  setup do
    @massage = massages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:massages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create massage" do
    assert_difference('Massage.count') do
      post :create, massage: { post: @massage.post }
    end

    assert_redirected_to massage_path(assigns(:massage))
  end

  test "should show massage" do
    get :show, id: @massage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @massage
    assert_response :success
  end

  test "should update massage" do
    put :update, id: @massage, massage: { post: @massage.post }
    assert_redirected_to massage_path(assigns(:massage))
  end

  test "should destroy massage" do
    assert_difference('Massage.count', -1) do
      delete :destroy, id: @massage
    end

    assert_redirected_to massages_path
  end
end
