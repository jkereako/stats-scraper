require Rails.root.join('app', 'services', 'downloaders', 'nhl_downloader')

class NHLDownloaderTest < ActiveSupport::TestCase
  setup do
    @downloader = NHLDownloader.new
    @team_identifier = '01'
  end

  test 'league standings download' do
    assert_not_nil @downloader.league_standings()
  end

  test 'team schedule download' do
    result = @downloader.team_schedule team_identifier: @team_identifier
    assert_equal 12, result.count

    # Ensure each schedule is not nil
    result.each do |file|
      assert_not_nil file
    end
  end
end

