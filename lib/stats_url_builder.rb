module STATSURLBuilder
  BASE_URL = 'http://stats.nesn.com'

  def league_standings_url(league:)
    File.join(BASE_URL, league, 'standings.asp')
  end

  def team_schedule_url(league:, team_identifier:, month_number:)
    team_stats_url_helper league: league,
                                  doctype: 'schedule',
                                  team_identifier: team_identifier,
                                  month_number: month_number
  end

  def team_stats_url(league:, team_identifier:)
    team_stats_url_helper league: league,
                          doctype: 'stats',
                          team_identifier: team_identifier
  end

  def team_roster_url(league:, team_identifier:)
    team_stats_url_helper league: league,
                          doctype: 'roster',
                          team_identifier: team_identifier
  end

  def team_injuries_url(league:, team_identifier:)
    team_stats_url_helper league: league,
                          doctype: 'injuries',
                          team_identifier: team_identifier
  end

  def team_transactions_url(league:, team_identifier:)
    team_stats_url_helper league: league,
                          doctype: 'transactions',
                          team_identifier: team_identifier
  end

  private
  def team_stats_url_helper(league:, doctype:, team_identifier:, month_number: nil)
    query_args = {teamno: team_identifier, type: doctype}

    if !month_number.nil?
      query_args['month'] = month_number
    end

    base = File.join(BASE_URL, league, 'teamstats.asp')
    base + '?' + query_args.to_query
  end
end

