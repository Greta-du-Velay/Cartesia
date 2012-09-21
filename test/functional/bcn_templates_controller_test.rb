require 'test_helper'

class BcnTemplatesControllerTest < ActionController::TestCase
  setup do
    @bcn_template = bcn_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bcn_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bcn_template" do
    assert_difference('BcnTemplate.count') do
      post :create, :bcn_template => @bcn_template.attributes
    end

    assert_redirected_to bcn_template_path(assigns(:bcn_template))
  end

  test "should show bcn_template" do
    get :show, :id => @bcn_template.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bcn_template.to_param
    assert_response :success
  end

  test "should update bcn_template" do
    put :update, :id => @bcn_template.to_param, :bcn_template => @bcn_template.attributes
    assert_redirected_to bcn_template_path(assigns(:bcn_template))
  end

  test "should destroy bcn_template" do
    assert_difference('BcnTemplate.count', -1) do
      delete :destroy, :id => @bcn_template.to_param
    end

    assert_redirected_to bcn_templates_path
  end
end
