class Nhl::TeamsController < ApplicationController
  # GET /teams
  def index
    @teams = Team.for_league 'NHL'
  end
end
