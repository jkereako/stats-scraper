require Rails.root.join('app', 'services', 'parsers', 'nhl', 'namespace')

# Parse the roster for an NHL team
class NHLParser::Roster
  def initialize(text:)
    @text = text
  end

  # It was decided to use strings instead of symbols for keys because of the "."
  # in "no.". It's easier to read to keep all of the keys as symbols OR strings,
  # but not both.
  # | No. | Name | Pos | Ht | Wt | Born | Birthplace |
  HEADING = ['no.', 'name', 'pos', 'ht', 'wt', 'born', 'birthplace'].freeze

  def parse
    count = 0
    player = new_player
    players = []

    # Split the text by either a newline or carriage return
    @text.split( /\r?\n/ ).each do |line|
      # Make sure the line is clean and predictable
      clean_line = line.strip.downcase()

      # Skip the heading and nil or empty lines
      next if HEADING.include? clean_line or clean_line.blank?

      # If we've reached the end of the player's stats, add the player to the
      # array of players and restart
      if count == HEADING.count
        count = 0

        players.push player unless player.nil?

        player = new_player
      end

      player[HEADING[count]] = clean_line

      count += 1
    end # /each

    # Push the last player on to the standings list.
    players.push player unless player.nil?

    players
  end

  private

  def new_player
    {'no.' => '', 'name' => '', 'pos' => '', 'ht' => '', 'wt' => '',
     'born' => '', 'birthplace' => ''}
  end
end

