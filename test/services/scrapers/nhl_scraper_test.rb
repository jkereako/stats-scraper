require 'test_helper'
require Rails.root.join('app', 'services', 'scrapers', 'nhl_scraper')

class NHLScraperTest < ActiveSupport::TestCase
  FIXTURE_PATH = File.join ActiveSupport::TestCase.fixture_path, 'scrapers'

  test 'league standings' do
    file = read_file 'nhl-league-standings.html'
    scraper = NHLScraper.new document: file
    result = scraper.league_standings
    assert_not_empty result
  end

  test 'league injuries' do
    file = read_file 'nhl-league-injuries.html'
    scraper = NHLScraper.new document: file
    result = scraper.league_injuries
    assert_not_empty result
  end

  test 'roster' do
    file = read_file 'nhl-roster.html'
    scraper = NHLScraper.new document: file
    result = scraper.team_roster
    assert_not_empty result
  end

  private

  def read_file(file)
    File.read File.join FIXTURE_PATH, file
  end

  # This is a helper method which is only used, for now, in writing the scraped
  # text to the test/fixtures directory
  def write_file(file_name:, text:)
    File.open(file_name, 'w') { |file| file.write text }
  end
end

