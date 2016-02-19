require 'test_helper'
require Rails.root.join 'app', 'services', 'parsers', 'nhl', 'league_standings'

class NHLParserTest < ActiveSupport::TestCase
  FIXTURE_PATH = File.join ActiveSupport::TestCase.fixture_path, 'parsers',
    'nhl-league-standings.txt'
  EXPECTATION_PATH = File.join ActiveSupport::TestCase.fixture_path, 'parsers',
    'expectation.json'

  setup do
    @parser = NHLParser::LeagueStandings.new
  end

  test 'league standings text parsing' do
    text = File.read FIXTURE_PATH
    file = File.read EXPECTATION_PATH

    expectation = JSON.parse file

    result = @parser.league_standings text: text

    # TODO: add better assertions
    assert_equal  expectation.count, result.count
  end
end

