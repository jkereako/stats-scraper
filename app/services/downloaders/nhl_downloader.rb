require 'open-uri'

class NHLDownloader
  include STATSURLBuilder

  def league_standings()
    open league_standings_url(league: 'nhl')
  end

  # Download all of the team's schedules
  def team_schedule(team_identifier:)
    # List the months with leading zeroes in the order in which they appear
    months = ['09', '10', '11', '12', '01', '02', '03', '04']
    schedules = []

    for month in months  do
    # Print the months as numbers and pad them with zeroes. This is the format
    # which STATS expects
      file = open team_schedule_url(league: 'nhl',
                             team_identifier: team_identifier,
                             month_number:month)
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

