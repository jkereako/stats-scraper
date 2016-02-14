class Team < ApplicationRecord
  scope :for_league, ->(league) { where league: league }
end

