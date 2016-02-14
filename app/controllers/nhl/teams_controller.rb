class Nhl::TeamsController < ApplicationController
  before_action :set_team, only: :show

  # GET /teams
  def index
    @teams = Team.for_league 'NHL'
    #render json: @teams
  end

  # GET /teams/1
  def show
    render json: @team
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def team_params
      params.fetch(:team, {})
    end
end
