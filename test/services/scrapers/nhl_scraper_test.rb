require 'test_helper'
require Rails.root.join('app', 'services', 'scrapers', 'nhl_scraper')

class NHLScraperTest < ActiveSupport::TestCase
  setup do
    @fixture_path = ActiveSupport::TestCase.fixture_path
    @scraper = NHLScraper.new
  end

  test 'league standings' do
    file = open_readonly_file path: @fixture_path,
                              file_name: 'nhl-league-standings.html'

    result = @scraper.league_standings file: file
    assert_not_empty result

    file.close
  end
end
