require 'test_helper'
require Rails.root.join('app', 'services', 'scrapers', 'nhl_scraper')

class NHLScraperTest < ActiveSupport::TestCase
  FIXTURE_PATH = File.join ActiveSupport::TestCase.fixture_path, 'scrapers'

  test 'league standings' do
    file = File.read File.join(FIXTURE_PATH, 'nhl-league-standings.html')
    scraper = NHLScraper.new file: file
    result = scraper.league_standings
    assert_not_empty result
  end

  test 'roster' do
    file = File.read File.join(FIXTURE_PATH, 'nhl-roster.html')
    scraper = NHLScraper.new file: file
    result = scraper.team_roster
    assert_not_empty result
  end
end

