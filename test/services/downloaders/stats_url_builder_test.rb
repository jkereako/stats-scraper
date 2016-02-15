require 'stats_url_builder'

class STATSURLBuilderTest < ActiveSupport::TestCase
  setup do
    # Create an anonymous class to encapsulate the module.
    @subject = Class.new { extend STATSURLBuilder }
    @team_identifier = '01'
  end

  teardown do
    @subject = nil
  end

  test 'league standings URL' do
    assert_equal 'http://stats.nesn.com/nhl/standings.asp',
                 @subject.league_standings_url(league: 'nhl')
  end

  test 'team schedule URL' do
    assert_equal 'http://stats.nesn.com/nhl/teamstats.asp?month=01&teamno=01&type=schedule',
                 @subject.team_schedule_url(league: 'nhl',
                                            team_identifier: @team_identifier,
                                            month_number:'01')
  end

  test 'team stats URL' do
    assert_equal 'http://stats.nesn.com/nhl/teamstats.asp?teamno=01&type=stats',
                 @subject.team_stats_url(league: 'nhl',
                                         team_identifier: @team_identifier)
  end

  test 'team roster URL' do
    assert_equal 'http://stats.nesn.com/nhl/teamstats.asp?teamno=01&type=roster',
                 @subject.team_roster_url(league: 'nhl',
                                          team_identifier: @team_identifier)
  end

  test 'team injuries URL' do
    assert_equal 'http://stats.nesn.com/nhl/teamstats.asp?teamno=01&type=injuries',
                 @subject.team_injuries_url(league: 'nhl',
                                            team_identifier: @team_identifier)
  end

  test 'team transactions URL' do
    assert_equal 'http://stats.nesn.com/nhl/teamstats.asp?teamno=01&type=transactions',
                 @subject.team_transactions_url(league: 'nhl',
                                                team_identifier: @team_identifier)
  end
end

