require 'test_helper'
require Rails.root.join 'app', 'services', 'parsers', 'nhl', 'team_roster'

class NHLParser::TeamRosterTest < ActiveSupport::TestCase

  setup do
    @text = File.read File.join ActiveSupport::TestCase.fixture_path, 'parsers',
    'nhl-team-roster.txt'
    @parser = NHLParser::TeamRoster.new text: @text
  end

  test 'roster text parsing' do
    result = @parser.parse

    # We expect 24 players
    assert_equal 24, result.count
  end
end

