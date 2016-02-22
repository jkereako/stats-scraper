require 'test_helper'
require Rails.root.join 'app', 'services', 'parsers', 'nhl', 'team_schedule'

class NHLParser::TeamScheduleTest < ActiveSupport::TestCase

  test 'schedule parsing' do
    months = [9, 10, 11, 12, 1, 2, 3, 4]

    for month in months
      path = File.join ActiveSupport::TestCase.fixture_path, 'parsers',
        'schedules', "nhl-team-schedule-month-#{month}.txt"
      text = File.read path
      parser = NHLParser::TeamSchedule.new text: text

      result = parser.parse

      assert_not_empty result
    end
  end
end

