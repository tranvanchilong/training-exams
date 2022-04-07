require 'test_helper'

class AchievementControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get achievement_show_url
    assert_response :success
  end

end
