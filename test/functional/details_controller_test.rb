require 'test_helper'

class DetailsControllerTest < ActionController::TestCase
  setup do
    @detail = details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detail" do
    assert_difference('Detail.count') do
      post :create, detail: { km_de_all: @detail.km_de_all, km_de_job: @detail.km_de_job, km_de_warranty: @detail.km_de_warranty, time_de_all: @detail.time_de_all, time_de_job: @detail.time_de_job, time_de_warranty: @detail.time_de_warranty }
    end

    assert_redirected_to detail_path(assigns(:detail))
  end

  test "should show detail" do
    get :show, id: @detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detail
    assert_response :success
  end

  test "should update detail" do
    put :update, id: @detail, detail: { km_de_all: @detail.km_de_all, km_de_job: @detail.km_de_job, km_de_warranty: @detail.km_de_warranty, time_de_all: @detail.time_de_all, time_de_job: @detail.time_de_job, time_de_warranty: @detail.time_de_warranty }
    assert_redirected_to detail_path(assigns(:detail))
  end

  test "should destroy detail" do
    assert_difference('Detail.count', -1) do
      delete :destroy, id: @detail
    end

    assert_redirected_to details_path
  end
end
