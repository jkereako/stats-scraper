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

end
