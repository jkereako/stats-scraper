class Team < ApplicationRecord
  scope :for_league, ->(league) { where league: league }
  scope :with_stats_identifier, ->(stats_id) {
    where stats_identifier: stats_id
  }
end

