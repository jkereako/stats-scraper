require Rails.root.join('app', 'services', 'parsers', 'nhl', 'namespace')

# Parse the league standings for the NHL
class NHLParser::LeagueStandings
  # Below is the heading for the league standings table. The text to parse will
  # always be read in this order. As such, an array which reflects each
  # individual statistic's position has been created.
  #
  # | GP | W | L | OTL | Pts | GF | GA | Home | Road | L10 |
  STATS = [:gp, :w, :l, :otl, :pts, :gf, :ga, :home, :road, :l10].freeze

  # This constant array represents text we don't care about.
  GARBAGE = ['eastern conference', 'western conference',
             'metropolitan division', 'atlantic division', 'pacific division',
             'central division'].freeze

  TEAMS = (Team.select(:name).map { |t| t.name.downcase }).freeze

  def league_standings(text:)
    statistic_position = 0

    standings = []
    team = nil
    # Split the text by either a newline or carriage return
    text.split( /\r?\n/ ).each do |line|
      # Make sure the line is clean and predictable
      clean_line = line.strip.downcase()

      # Skip garbage lines and statistics headers
      next if GARBAGE.include? clean_line or STATS.include? clean_line.to_sym or
        # `blank` checks for both nil and empty values.
        clean_line.blank?

      # If the line is a team name, then we know the following lines will be the
      # team's statistics in the order declared in the constants `STATS`
      if (idx = TEAMS.index clean_line)
        statistic_position = 0
        # If a team already exists, then push it onto the standings array.
        standings.push team unless team.nil?

        # Create a new team
        team = {name: TEAMS[idx],
                stats: {gp: 0, w: 0, l: 0, otl: 0, pts: 0, gf: 0, ga: 0,
                        home: '', road: '', l10: ''}
        }

        # Advance to the next line
        next
      end

      # Draw attention to unexpected behavior
      if statistic_position > STATS.count
        raise "Went beyond known statistics"
      end

      # Down here, we're only dealing with team statistics
      # | GP | W | L | OTL | Pts | GF | GA | Home | Road | L10 |

      team[:stats][STATS[statistic_position]] = clean_line

      statistic_position += 1
    end # /each

    standings
  end
end

