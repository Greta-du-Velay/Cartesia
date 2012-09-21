require 'test_helper'

class CompanyBcnsControllerTest < ActionController::TestCase
  setup do
    @company_bcn = company_bcns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_bcns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_bcn" do
    assert_difference('MyBcn.count') do
      post :create, :company_bcn => @company_bcn.attributes
    end

    assert_redirected_to company_bcn_path(assigns(:company_bcn))
  end

  test "should show company_bcn" do
    get :show, :id => @company_bcn.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @company_bcn.to_param
    assert_response :success
  end

  test "should update company_bcn" do
    put :update, :id => @company_bcn.to_param, :company_bcn => @company_bcn.attributes
    assert_redirected_to company_bcn_path(assigns(:company_bcn))
  end

  test "should destroy company_bcn" do
    assert_difference('MyBcn.count', -1) do
      delete :destroy, :id => @company_bcn.to_param
    end

    assert_redirected_to company_bcns_path
  end
end
