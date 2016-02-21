require Rails.root.join 'app', 'services', 'parsers', 'nhl', 'namespace'

# Parse the league injuries for the NHL
class NHLParser::LeagueInjuries
  def initialize text:
    @text = text
  end

  # | Date | Player | Status |
  HEADING = [:date, :player, :status].freeze

  # All of the 30 NHL teams plus the 2 all-star teams
  TEAMS = (['metropolitan all-stars', 'pacific all-stars'] +
           Team.select(:name).map { |t| t.name.downcase }).freeze

  # The text used when no injuries for a team exist
  NO_INJURIES = 'no recent injuries for this team'

  def parse
    count = 0

    injuries = []
    team = nil
    player = new_player
    # Split the text by either a newline or carriage return
    @text.split( /\r?\n/ ).each do |line|
      # Check for proper indexing
      if count > HEADING.count
        raise 'Index beyond expected bounds'
      end

      # Make sure the line is clean and predictable
      clean_line = line.strip.downcase

      # Skip table heading
      next if HEADING.include? clean_line.to_sym or clean_line.blank?

      # If there are no injuries, then don't add it to the list
      if clean_line == NO_INJURIES
        player = nil
        team = nil
        count = 0
        next
      end

      if count == HEADING.count #- 1
        team[:players].push player unless player.nil?
        player = new_player
        count = 0
      end

      # Is the line a team name?
      if (idx = TEAMS.index clean_line)
        # If a team already exists, then push it onto the standings array.
        injuries.push team unless team.nil?

        # Create a new team
        team = {name: TEAMS[idx], players: []}

        # Advance to the next line
        next
      end

      # Assign player data
      player[HEADING[count]] = clean_line

      count += 1
    end # /each

    # Push the last player to the team and the last team to the injuries list
    team[:players].push player unless player.nil?
    injuries.push team unless team.nil?

    injuries
  end

  private

  def new_player
    {date: '', player: '', status: ''}
  end
end

