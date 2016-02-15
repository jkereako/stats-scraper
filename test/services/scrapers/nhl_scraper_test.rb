class NHLScraperTest < ActiveSupport::TestCase
  setup do
    @team = teams(:one)
  end

  # Is this test necessary? I feel that it would be testing the open_uri
  # framework which has already been tested.
  test "ought to download team stats" do
    get teams_url
    assert_response :success
  end

  # This would test our scraping methods to see if 
  test "ought to parse html" do
    get teams_url
    assert_response :success
  end
end
