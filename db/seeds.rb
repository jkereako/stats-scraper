# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ==== NHL teams ==== #
#-- Eastern conference
# Atlantic division
Team.new(league: 'NHL', conference: 'Eastern', division: 'Atlantic',
         name: 'Boston Bruins', stats_identifier:'01').save()

Team.new(league: 'NHL', conference: 'Eastern', division: 'Atlantic',
         name: 'Buffalo Sabres', stats_identifier:'02').save()

Team.new(league: 'NHL', conference: 'Eastern', division: 'Atlantic',
         name: 'Detroit Red Wings', stats_identifier:'05').save()

Team.new(league: 'NHL', conference: 'Eastern', division: 'Atlantic',
         name: 'Florida Panthers', stats_identifier:'26').save()

Team.new(league: 'NHL', conference: 'Eastern', division: 'Atlantic',
         name: 'Montreal Canadiens', stats_identifier:'10').save()

Team.new(league: 'NHL', conference: 'Eastern', division: 'Atlantic',
         name: 'Ottawa Senators', stats_identifier:'14').save()

Team.new(league: 'NHL', conference: 'Eastern', division: 'Atlantic',
         name: 'Tampa Bay Lightning', stats_identifier:'20').save()

Team.new(league: 'NHL', conference: 'Eastern', division: 'Atlantic',
         name: 'Toronto Maple Leafs', stats_identifier: '21').save()

# Metropolitan division
Team.new(league: 'NHL', conference: 'Eastern', division: 'Metropolitan',
         name: 'Carolina Hurricanes', stats_identifier: '07').save()

Team.new(league: 'NHL', conference: 'Eastern', division: 'Metropolitan',
         name: 'Columbus Blue Jackets', stats_identifier: '29').save()

Team.new(league: 'NHL', conference: 'Eastern', division: 'Metropolitan',
         name: 'New Jersey Devils', stats_identifier: '11').save()

Team.new(league: 'NHL', conference: 'Eastern', division: 'Metropolitan',
         name: 'New York Islanders', stats_identifier: '12').save()

Team.new(league: 'NHL', conference: 'Eastern', division: 'Metropolitan',
         name: 'New York Rangers', stats_identifier: '13').save()

Team.new(league: 'NHL', conference: 'Eastern', division: 'Metropolitan',
         name: 'Philadelphia Flyers', stats_identifier: '15').save()

Team.new(league: 'NHL', conference: 'Eastern', division: 'Metropolitan',
         name: 'Pittsburgh Penguins', stats_identifier: '16').save()

Team.new(league: 'NHL', conference: 'Eastern', division: 'Metropolitan',
         name: 'Washington Capitals', stats_identifier: '23').save()

#-- Western conference
# Atlantic division
Team.new(league: 'NHL', conference: 'Western', division: 'Central',
         name: 'Chicago Blackhawks', stats_identifier: '04').save()

Team.new(league: 'NHL', conference: 'Western', division: 'Central',
         name: 'Colorado Avalanche', stats_identifier: '17').save()

Team.new(league: 'NHL', conference: 'Western', division: 'Central',
         name: 'Dallas Stars', stats_identifier: '09').save()

Team.new(league: 'NHL', conference: 'Western', division: 'Central',
         name: 'Minnesota Wild', stats_identifier: '30').save()

Team.new(league: 'NHL', conference: 'Western', division: 'Central',
         name: 'Nashville Predators', stats_identifier: '27').save()

Team.new(league: 'NHL', conference: 'Western', division: 'Central',
         name: 'St. Louis Blues', stats_identifier: '19').save()

Team.new(league: 'NHL', conference: 'Western', division: 'Central',
         name: 'Winnipeg Jets', stats_identifier: '28').save()

Team.new(league: 'NHL', conference: 'Western', division: 'Pacific',
         name: 'Anaheim Ducks', stats_identifier: '25').save()

Team.new(league: 'NHL', conference: 'Western', division: 'Pacific',
         name: 'Arizona Coyotes', stats_identifier: '24').save()

Team.new(league: 'NHL', conference: 'Western', division: 'Pacific',
         name: 'Calgary Flames', stats_identifier: '03').save()

Team.new(league: 'NHL', conference: 'Western', division: 'Pacific',
         name: 'Edmonton Oilers', stats_identifier: '06').save()

Team.new(league: 'NHL', conference: 'Western', division: 'Pacific',
         name: 'Los Angeles Kings', stats_identifier: '08').save()

Team.new(league: 'NHL', conference: 'Western', division: 'Pacific',
         name: 'San Jose Sharks', stats_identifier: '18').save()

Team.new(league: 'NHL', conference: 'Western', division: 'Pacific',
         name: 'Vancouver Canucks', stats_identifier: '22').save()

