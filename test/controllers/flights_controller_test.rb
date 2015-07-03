require 'test_helper'

class FlightsControllerTest < ActionController::TestCase
  setup do
    @flight = flights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flight" do
    assert_difference('Flight.count') do
      post :create, flight: { arriving_airport: @flight.arriving_airport, arriving_at: @flight.arriving_at, arriving_location: @flight.arriving_location, departing_airport: @flight.departing_airport, departing_at: @flight.departing_at, departing_location: @flight.departing_location, destination_id: @flight.destination_id, flight_number: @flight.flight_number }
    end

    assert_redirected_to flight_path(assigns(:flight))
  end

  test "should show flight" do
    get :show, id: @flight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flight
    assert_response :success
  end

  test "should update flight" do
    patch :update, id: @flight, flight: { arriving_airport: @flight.arriving_airport, arriving_at: @flight.arriving_at, arriving_location: @flight.arriving_location, departing_airport: @flight.departing_airport, departing_at: @flight.departing_at, departing_location: @flight.departing_location, destination_id: @flight.destination_id, flight_number: @flight.flight_number }
    assert_redirected_to flight_path(assigns(:flight))
  end

  test "should destroy flight" do
    assert_difference('Flight.count', -1) do
      delete :destroy, id: @flight
    end

    assert_redirected_to flights_path
  end
end
