require 'test_helper'

class LearningIndicatorsControllerTest < ActionController::TestCase
  setup do
    @learning_indicator = learning_indicators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learning_indicators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learning_indicator" do
    assert_difference('LearningIndicator.count') do
      post :create, :learning_indicator => @learning_indicator.attributes
    end

    assert_redirected_to learning_indicator_path(assigns(:learning_indicator))
  end

  test "should show learning_indicator" do
    get :show, :id => @learning_indicator.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @learning_indicator.to_param
    assert_response :success
  end

  test "should update learning_indicator" do
    put :update, :id => @learning_indicator.to_param, :learning_indicator => @learning_indicator.attributes
    assert_redirected_to learning_indicator_path(assigns(:learning_indicator))
  end

  test "should destroy learning_indicator" do
    assert_difference('LearningIndicator.count', -1) do
      delete :destroy, :id => @learning_indicator.to_param
    end

    assert_redirected_to learning_indicators_path
  end
end
