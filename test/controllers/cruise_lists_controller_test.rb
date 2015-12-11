require 'test_helper'

class CruiseListsControllerTest < ActionController::TestCase
  setup do
    @cruise_list = cruise_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cruise_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cruise_list" do
    assert_difference('CruiseList.count') do
      post :create, cruise_list: { content: @cruise_list.content, slug: @cruise_list.slug, title: @cruise_list.title, venue_id: @cruise_list.venue_id }
    end

    assert_redirected_to cruise_list_path(assigns(:cruise_list))
  end

  test "should show cruise_list" do
    get :show, id: @cruise_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cruise_list
    assert_response :success
  end

  test "should update cruise_list" do
    patch :update, id: @cruise_list, cruise_list: { content: @cruise_list.content, slug: @cruise_list.slug, title: @cruise_list.title, venue_id: @cruise_list.venue_id }
    assert_redirected_to cruise_list_path(assigns(:cruise_list))
  end

  test "should destroy cruise_list" do
    assert_difference('CruiseList.count', -1) do
      delete :destroy, id: @cruise_list
    end

    assert_redirected_to cruise_lists_path
  end
end
