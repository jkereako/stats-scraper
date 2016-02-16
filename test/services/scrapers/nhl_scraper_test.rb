require 'test_helper'
require Rails.root.join('app', 'services', 'scrapers', 'nhl_scraper')

class NHLScraperTest < ActiveSupport::TestCase
  setup do
    @fixture_path = ActiveSupport::TestCase.fixture_path
    @scraper = NHLScraper.new
  end

  test 'league standings' do
    file_path = File.join @fixture_path, 'nhl-league-standings.html'
    file = File.open file_path, 'r'
    result = @scraper.league_standings file: file
    assert_not_empty result
  end
end
