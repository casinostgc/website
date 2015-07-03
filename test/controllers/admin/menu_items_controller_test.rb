require 'test_helper'

class Admin::MenuItemsControllerTest < ActionController::TestCase
  setup do
    @admin_menu_item = admin_menu_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_menu_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_menu_item" do
    assert_difference('Admin::MenuItem.count') do
      post :create, admin_menu_item: { blank_target: @admin_menu_item.blank_target, href: @admin_menu_item.href, icon: @admin_menu_item.icon, page_id: @admin_menu_item.page_id, position: @admin_menu_item.position, text: @admin_menu_item.text }
    end

    assert_redirected_to admin_menu_item_path(assigns(:admin_menu_item))
  end

  test "should show admin_menu_item" do
    get :show, id: @admin_menu_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_menu_item
    assert_response :success
  end

  test "should update admin_menu_item" do
    patch :update, id: @admin_menu_item, admin_menu_item: { blank_target: @admin_menu_item.blank_target, href: @admin_menu_item.href, icon: @admin_menu_item.icon, page_id: @admin_menu_item.page_id, position: @admin_menu_item.position, text: @admin_menu_item.text }
    assert_redirected_to admin_menu_item_path(assigns(:admin_menu_item))
  end

  test "should destroy admin_menu_item" do
    assert_difference('Admin::MenuItem.count', -1) do
      delete :destroy, id: @admin_menu_item
    end

    assert_redirected_to admin_menu_items_path
  end
end
