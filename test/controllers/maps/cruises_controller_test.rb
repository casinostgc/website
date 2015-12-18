require 'test_helper'

class Maps::CruisesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
