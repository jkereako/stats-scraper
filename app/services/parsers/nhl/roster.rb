require Rails.root.join('app', 'services', 'parsers', 'nhl', 'namespace')

# Parse the roster for an NHL team
class NHLParser::Roster
  def initialize(team_identifier:, text:)
    @team = Team.for_league('NHL').with_stats_identifier(team_identifier)
    @text = text

    # Raise an error if the stats identifier is not associated with a team. This
    # would be the fault of the programmer.
    if @team.empty?
      raise 'Team does not exist'
    end
  end

  # It was decided to use strings instead of symbols for keys because of the "."
  # in "no.". It's easier to read to keep all of the keys as symbols OR strings,
  # but not both.
  # | No. | Name | Pos | Ht | Wt | Born | Birthplace |
  HEADING = ['no.', 'name', 'pos', 'ht', 'wt', 'born', 'birthplace'].freeze

  def parse
    count = 0
    player = {'no.' => '', 'name' => '', 'pos' => '', 'ht' => '',
              'wt' => '', 'born' => '', 'birthplace' => ''}
    players = []

    # Split the text by either a newline or carriage return
    @text.split( /\r?\n/ ).each do |line|
      # Make sure the line is clean and predictable
      clean_line = line.strip.downcase()

      # Skip the heading and nil or empty lines
      next if HEADING.include? clean_line or clean_line.blank? or

      if count == HEADING.count
        count = 0
        # If a team already exists, then push it onto the standings array.
        players.push player unless player.nil?

        # Create a new team
        player = {'no.' => '', 'name' => '', 'pos' => '', 'ht' => '',
                  'wt' => '', 'born' => '', 'birthplace' => ''}
        # Advance to the next line
      end

      # Draw attention to unexpected behavior
      #if statistic_position > STATS.count
      #  raise "Went beyond known statistics"
      #end

      player[HEADING[count]] = clean_line

      count += 1
    end # /each

    # Push the last team on to the standings list.
    players.push player unless player.nil?

    players
  end
end

