require 'test_helper'

class LamersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get lamers_new_url
    assert_response :success
  end

end
