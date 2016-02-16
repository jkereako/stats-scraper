class NHLScraper
  def league_standings(file:)
    # //div[@id="shsStandings"]/table[2]/tbody/tr
    list = []
    document = Nokogiri::HTML file
    document.xpath('//div[@id="shsStandings"]/table[2]/tbody/tr').each do |row|
      # TODO: clean the data so that a well-formed hash is returned
      list.push row
    end

    list
  end
end
