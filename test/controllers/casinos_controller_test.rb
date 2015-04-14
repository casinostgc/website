require 'test_helper'

class CasinosControllerTest < ActionController::TestCase
  setup do
    @casino = casinos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:casinos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create casino" do
    assert_difference('Casino.count') do
      post :create, casino: { address: @casino.address, content: @casino.content, latitude: @casino.latitude, longitude: @casino.longitude, name: @casino.name, slug: @casino.slug }
    end

    assert_redirected_to casino_path(assigns(:casino))
  end

  test "should show casino" do
    get :show, id: @casino
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @casino
    assert_response :success
  end

  test "should update casino" do
    patch :update, id: @casino, casino: { address: @casino.address, content: @casino.content, latitude: @casino.latitude, longitude: @casino.longitude, name: @casino.name, slug: @casino.slug }
    assert_redirected_to casino_path(assigns(:casino))
  end

  test "should destroy casino" do
    assert_difference('Casino.count', -1) do
      delete :destroy, id: @casino
    end

    assert_redirected_to casinos_path
  end
end
