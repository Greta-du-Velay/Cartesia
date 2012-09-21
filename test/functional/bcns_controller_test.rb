require 'test_helper'

class BcnsControllerTest < ActionController::TestCase
  setup do
    @bcn = bcns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bcns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bcn" do
    assert_difference('Bcn.count') do
      post :create, :bcn => @bcn.attributes
    end

    assert_redirected_to bcn_path(assigns(:bcn))
  end

  test "should show bcn" do
    get :show, :id => @bcn.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bcn.to_param
    assert_response :success
  end

  test "should update bcn" do
    put :update, :id => @bcn.to_param, :bcn => @bcn.attributes
    assert_redirected_to bcn_path(assigns(:bcn))
  end

  test "should destroy bcn" do
    assert_difference('Bcn.count', -1) do
      delete :destroy, :id => @bcn.to_param
    end

    assert_redirected_to bcns_path
  end
end
