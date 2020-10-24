require 'test_helper'

class VideoViewersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get video_viewers_create_url
    assert_response :success
  end

end
