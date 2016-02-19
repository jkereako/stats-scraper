# Extracts data from HTML and returns it as a plain text file.
class NHLScraper

  def initialize(file:)
    @document = Nokogiri::HTML file
  end

  # Extract the table which holds the league standings for the NHL
  def league_standings
    # This XPath works for all league standings: division, conference and
    # wildcard.
    @document.xpath('//div[@id="shsStandings"]/table[2]/tbody/tr').text
  end

  def team_roster
    @document.xpath('//div[@id="shsNHLTeamStats"]/table[1]').text
  end
end

