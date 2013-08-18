require 'test_helper'

class CarsControllerTest < ActionController::TestCase
  setup do
    @car = cars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create car" do
    assert_difference('Car.count') do
      post :create, car: { date_of_commissioning: @car.date_of_commissioning, date_warranty: @car.date_warranty, name: @car.name, name_org_warranty: @car.name_org_warranty, object_subdivisiod: @car.object_subdivisiod }
    end

    assert_redirected_to car_path(assigns(:car))
  end

  test "should show car" do
    get :show, id: @car
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @car
    assert_response :success
  end

  test "should update car" do
    put :update, id: @car, car: { date_of_commissioning: @car.date_of_commissioning, date_warranty: @car.date_warranty, name: @car.name, name_org_warranty: @car.name_org_warranty, object_subdivisiod: @car.object_subdivisiod }
    assert_redirected_to car_path(assigns(:car))
  end

  test "should destroy car" do
    assert_difference('Car.count', -1) do
      delete :destroy, id: @car
    end

    assert_redirected_to cars_path
  end
end
