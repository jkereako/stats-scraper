# Extracts data from an HTML document and returns plain text. Essentially, this
# file is a container for XPath queries.
class NHLScraper

  def initialize(document:)
    @document = Nokogiri::HTML document
  end

  # Extract the table which holds the league standings for the NHL
  def league_standings
    # This XPath works for all league standings: division, conference and
    # wildcard.
    @document.xpath('//div[@id="shsStandings"]/table[2]/tbody/tr').text
  end

  def league_injuries
    @document.xpath(
      '//div[@id="shsNHLInjuries"]/table[contains(concat(" ", normalize-space('\
      '@class), " "), " shsTable ")] | //div[@id="shsNHLInjuries"]/h2'
    ).text
  end

  def team_roster
    @document.xpath('//div[@id="shsNHLTeamStats"]/table[1]').text
  end
end

