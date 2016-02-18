require 'test_helper'
require Rails.root.join('app', 'services', 'parsers', 'nhl_parser')

class NHLParserTest < ActiveSupport::TestCase
  setup do
    @fixture_path = ActiveSupport::TestCase.fixture_path
    @parser = NHLParser.new
  end

  test 'league standings text parsing' do
    file_path = File.join @fixture_path, 'nhl-league-standings.txt'
    text = File.read file_path
    result = @parser.league_standings text: text

    # TODO: add better assertions
    assert_not_empty result
  end
end
