require 'test_helper'

class OthersControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get others_home_url
    assert_response :success
  end

end
