class NHLParser
  KEYWORDS = ['GP', 'W', 'L', 'OTL', 'Pts', 'GF', 'GA', 'Home', 'Road',
              'L10', 'Eastern Conference', 'Western Conference',
              'Metropolitan Division', 'Atlantic Division',
              'Pacific Division', 'Central Division'].freeze

  def league_standings(text:)
    text.split( /\r?\n/ ).each do |line|
      puts line
    end
  end
end
