require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new,update,destroy" do
    get :new,update,destroy
    assert_response :success
  end

end
