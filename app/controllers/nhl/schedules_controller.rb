class Nhl::SchedulesController < ApplicationController
  before_action :set_schedule, only: :show

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.fetch(:team, {})
    end
end
