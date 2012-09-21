require 'test_helper'

class PriorityRatingsControllerTest < ActionController::TestCase
  setup do
    @priority_rating = priority_ratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:priority_ratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create priority_rating" do
    assert_difference('PriorityRating.count') do
      post :create, :priority_rating => @priority_rating.attributes
    end

    assert_redirected_to priority_rating_path(assigns(:priority_rating))
  end

  test "should show priority_rating" do
    get :show, :id => @priority_rating.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @priority_rating.to_param
    assert_response :success
  end

  test "should update priority_rating" do
    put :update, :id => @priority_rating.to_param, :priority_rating => @priority_rating.attributes
    assert_redirected_to priority_rating_path(assigns(:priority_rating))
  end

  test "should destroy priority_rating" do
    assert_difference('PriorityRating.count', -1) do
      delete :destroy, :id => @priority_rating.to_param
    end

    assert_redirected_to priority_ratings_path
  end
end
