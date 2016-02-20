require 'test_helper'
require Rails.root.join 'app', 'services', 'parsers', 'nhl', 'league_standings'

class NHLParser::LeagueStandingsTest < ActiveSupport::TestCase

  setup do
    text = File.read File.join ActiveSupport::TestCase.fixture_path, 'parsers',
      'nhl-league-standings.txt'
    @parser = NHLParser::LeagueStandings.new text: text
  end

  test 'league standings text parsing' do

    result = @parser.parse

    assert_equal 30, result.count
  end
end

