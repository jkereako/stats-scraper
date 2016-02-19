require 'test_helper'
require Rails.root.join('app', 'services', 'scrapers', 'nhl_scraper')

class NHLScraperTest < ActiveSupport::TestCase
  setup do
    FIXTURE_PATH = File.join ActiveSupport::TestCase.fixture_path, 'scrapers',
      'nhl-league-standings.html'
  end

  test 'league standings' do
    file = File.read FIXTURE_PATH

    scraper = NHLScraper.new file: file
    result = scraper.league_standings
    assert_not_empty result
  end
end

