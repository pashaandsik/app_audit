require 'test_helper'

class MileageAllsControllerTest < ActionController::TestCase
  setup do
    @mileage_all = mileage_alls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mileage_alls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mileage_all" do
    assert_difference('MileageAll.count') do
      post :create, mileage_all: { km_all: @mileage_all.km_all, m_ch_all: @mileage_all.m_ch_all }
    end

    assert_redirected_to mileage_all_path(assigns(:mileage_all))
  end

  test "should show mileage_all" do
    get :show, id: @mileage_all
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mileage_all
    assert_response :success
  end

  test "should update mileage_all" do
    put :update, id: @mileage_all, mileage_all: { km_all: @mileage_all.km_all, m_ch_all: @mileage_all.m_ch_all }
    assert_redirected_to mileage_all_path(assigns(:mileage_all))
  end

  test "should destroy mileage_all" do
    assert_difference('MileageAll.count', -1) do
      delete :destroy, id: @mileage_all
    end

    assert_redirected_to mileage_alls_path
  end
end
