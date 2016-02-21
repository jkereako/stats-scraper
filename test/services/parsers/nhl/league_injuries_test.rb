require 'test_helper'
require Rails.root.join 'app', 'services', 'parsers', 'nhl', 'league_injuries'

class NHLParser::LeagueInjuriesTest < ActiveSupport::TestCase

  setup do
    text = File.read File.join ActiveSupport::TestCase.fixture_path, 'parsers',
      'nhl-league-injuries.txt'
    @parser = NHLParser::LeagueInjuries.new text: text
  end

  test 'league injuries text parsing' do
    result = @parser.parse

    # Assert all 30 teams are represented
    assert_equal 30, result.count
  end
end

