# STATS Scraper
Scrapes stats.nesn.com for up-to-date sports information and repackages it as
well-formatted JSON.

This is a Rails API version of my previous [STATS scraper written in
Flask](https://github.com/jkereako/stats-html-scraper-api).

It is built with Rails 5 beta 3 using the [API generator
configuration](http://edgeguides.rubyonrails.org/api_app.html). This will be a
much more reliable scaper than the Flask version because I'm writing tests for
the code as I go. There are zero tests for the Flask scraper.

# App components
The goal of this project is to have a clear separation of concerns. The scraping
is split into 3 constituent parts: downloading, scraping and parsing.

Before anything, the web page is downloaded and then the HTML is scraped using
an XPath query. The scraped data is returned as text and since this project
deals with tabular data, that text is delimited by newlines. Next, the newline
delimited text is passed to the parser where the text is converted into a Ruby
hash which can easily be displayed as JSON. Another process may be added which
sorts the parsed Ruby hash into a logical order. For instance, sorting teams by
division or by league standing.

# Data storage
Since the data is temporal and since our concern is delivering updated
information, it is pointless to store the data in a database. Instead, the
parsed JSON will be written to a static JSON file and that is what the web
server will display to users.

