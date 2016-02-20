require 'test_helper'
require Rails.root.join 'app', 'services', 'parsers', 'nhl', 'roster'

class NHLParser::RosterTest < ActiveSupport::TestCase

  setup do
    @text = File.read File.join ActiveSupport::TestCase.fixture_path, 'parsers',
    'nhl-roster.txt'
    @parser = NHLParser::Roster.new team_identifier: '01', text: @text
  end

  test 'roster text parsing' do
    result = @parser.parse

    # We expect 24 players
    assert_equal 24, result.count
  end
end

