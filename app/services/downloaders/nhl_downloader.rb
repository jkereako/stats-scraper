require 'open-uri'

class NHLDownloader
  include STATSURLBuilder

  def league_standings()
    open league_standings_url(league: 'nhl')
  end

  # Download all of the team's schedules
  def team_schedule(team_identifier:)
    schedules = []
    # Print the months as numbers and pad them with zeroes. This is the format
    # which STATS expects
    for i in  1..12 do
      month_number = sprintf '%02d', i
      file = open team_schedule_url(league: 'nhl',
                             team_identifier: team_identifier,
                             month_number:month_number)
      schedules.push file
    end

    schedules
  end

  def team_roster(team_identifier:)
    open team_roster_url league: 'nhl', team_identifier: team_identifier
  end
  
  def team_injuries(team_identifier:)
    open team_injuries_url league: 'nhl', team_identifier: team_identifier
  end

  def team_transactions(team_identifier:)
    open team_transactions_url league: 'nhl', team_identifier: team_identifier
  end

end
