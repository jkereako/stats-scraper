# Extracts data from an HTML document and returns plain text. Essentially, this
# file is a container for XPath queries.
class NHLScraper

  def initialize(document:)
    @document = Nokogiri::HTML document
  end

  # Extract the table which holds the league standings for the NHL
  def league_standings
    # Select the table rows `<tr>` within `<div id="shsStandings">`
    @document.xpath('//div[@id="shsStandings"]/table[2]/tbody/tr').text
  end

  def league_injuries
    # The XPath query is confusing because XPath does not support CSS class
    # selection. Hence, we must use magic.
    @document.xpath(
      '//div[@id="shsNHLInjuries"]/table[contains(concat(" ", normalize-space('\
      '@class), " "), " shsTable ")] | //div[@id="shsNHLInjuries"]/h2'
    ).text
  end

  def league_transactions
    # This XPath query is nearly identical to `league_injuries`, the only
    # difference is the `id` attribute.
    #
    # Should we extract the similarities into a helper method? While it would be
    # good programming practice to do so, these methods are already so simple
    # that I doubt it would have much of a benefit.
    @document.xpath(
      '//div[@id="shsNHLTrans"]/table[contains(concat(" ", normalize-space('\
      '@class), " "), " shsTable ")] | //div[@id="shsNHLTrans"]/h2'
    ).text
  end

  def team_roster
    # Select the table `<table>` within `<div id="shsNHLTeamStats">`
    @document.xpath('//div[@id="shsNHLTeamStats"]/table[1]').text
  end

  def team_schedule
    @document.xpath('//div[@id="shsNHLTeamStats"]/table').text
  end
end

