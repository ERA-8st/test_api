require 'test_helper'

class MusicsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get musics_search_url
    assert_response :success
  end

end
