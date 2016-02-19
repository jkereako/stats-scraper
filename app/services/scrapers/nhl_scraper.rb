# This class uses an XPath to extract the information we want. The data is
# returned as a File and the text from it will be processed elsewhere.
class NHLScraper

  def initialize(file:)
    @document = Nokogiri::HTML file
  end

  # Extract the table which holds the league standings for the NHL
  def league_standings
    # This XPath works for all league standings: division, conference and
    # wildcard.
    # //div[@id="shsStandings"]/table[2]/tbody/tr
    @document.xpath '//div[@id="shsStandings"]/table[2]/tbody/tr'
  end

  def team_roster
    @document.xpath '//div[@id="shsNHLTeamStats"]/table[1]'
  end
end
