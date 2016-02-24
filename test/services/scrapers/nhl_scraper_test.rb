require 'test_helper'
require Rails.root.join 'app', 'services', 'scrapers', 'nhl_scraper'

class NHLScraperTest < ActiveSupport::TestCase
  FIXTURE_PATH = File.join ActiveSupport::TestCase.fixture_path, 'scrapers'

  test 'scoreboard' do
    file = read_file 'nhl-scoreboard.html'
    scraper = NHLScraper.new document: file
    result = scraper.scoreboard
    assert_not_empty result
  end

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

  test 'league transactions' do
    file = read_file 'nhl-league-transactions.html'
    scraper = NHLScraper.new document: file
    result = scraper.league_transactions
    assert_not_empty result
  end

  test 'team roster' do
    file = read_file 'nhl-roster.html'
    scraper = NHLScraper.new document: file
    result = scraper.team_roster
    assert_not_empty result
  end

  test 'team schedule' do
    months = [9, 10, 11, 12, 1, 2, 3, 4]

    for month in months do
      file = read_file File.join(
        'schedules', "nhl-team-schedule-month-#{month}.html"
      )
      scraper = NHLScraper.new document: file
      result = scraper.team_schedule

      assert_not_empty result
    end
  end

  private

  def test_helper(file_name:)
  end

  def read_file(file)
    File.read File.join FIXTURE_PATH, file
  end

  # This is a helper method which is only used, for now, in writing the scraped
  # text to the test/fixtures directory
  def write_file(file_name:, text:)
    File.open(file_name, 'w') { |file| file.write text }
  end
end

