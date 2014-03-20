require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get accomodation" do
    get :accomodation
    assert_response :success
  end

end
