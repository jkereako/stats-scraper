require 'test_helper'

class Nhl::TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nhl_teams_url
    assert_response :success
  end
end
