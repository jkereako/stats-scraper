require 'test_helper'
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
    schedule_months = [9, 10, 11, 12, 1, 2, 3, 4]
    result = @downloader.team_schedule team_identifier: @team_identifier
    assert_equal schedule_months.count, result.count

    # Ensure each schedule is not nil
    result.each do |file|
      assert_not_nil file
    end
  end

  test 'team roster download' do
    assert_not_nil @downloader.team_roster team_identifier: @team_identifier
  end

  test 'team injuries download' do
    assert_not_nil @downloader.team_injuries team_identifier: @team_identifier
  end

  test 'team transactions download' do
    assert_not_nil @downloader.team_transactions team_identifier: @team_identifier
  end
end

