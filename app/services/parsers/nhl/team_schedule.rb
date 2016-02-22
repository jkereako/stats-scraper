require Rails.root.join 'app', 'services', 'parsers', 'nhl', 'namespace'

# Parse the roster for an NHL team
class NHLParser::TeamSchedule
  def initialize(text:)
    @text = text
  end

  # | Date | Opponent | Time | TV | Result |
  HEADING = [:date, :opponent, :time, :tv, :result].freeze
#  TEAMS = (Team.select(:name).map { |t| t.name.downcase }).freeze
  MONTHS = [:september, :october, :november, :december, :january, :february,
            :march, :april]

  def parse
    month = ''
    count = 0
    game = new_game
    schedule = new_schedule
    index = 0
    # Split the text by either a newline or carriage return
    @text.split( /\r?\n/ ).each do |line|
      if count > HEADING.count
        raise 'Index is beyond expected bounds'
      end

      # Make sure the line is clean and predictable
      clean_line = line.strip.downcase()

      # Skip the heading and nil or empty lines
      next if HEADING.include? clean_line.to_sym or clean_line.blank?

      # See which month we're parsing
      if (index = MONTHS.index clean_line.to_sym)
        month = MONTHS[index]
        next
      end

      # If we've reached the end of the player's stats, add the player to the
      # array of players and restart
      if count == HEADING.count
        if month.blank?
          raise 'Month is nil or empty'
        end

        count = 0

        schedule[month].push game unless game.nil?

        game = new_game
      end

      game[HEADING[count]] = clean_line

      count += 1
    end # /each

    # Push the last player on to the standings list.
    schedule[month].push game unless game.nil?

    schedule
  end

  private

  def new_game
    {opponent: '', date: '', time: '', tv: '', result: ''}
  end

  def new_schedule
    schedule = {}

    for month in MONTHS
      # A schedule is an array of games
      schedule[month] = []
    end

    schedule
  end
end

