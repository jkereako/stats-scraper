Rails.application.routes.draw do
  namespace :nhl do
    resources :teams, only: :index
#    get ':team/schedule' => 'schedules#show', as: 'team_schedule'
#    get ':team/roster' => 'rosters#show', as: 'team_roster'
#    get ':team/injuries' => 'injuries#show', as: 'team_injuries'
#    get ':team/stats' => 'stats#show', as: 'team_stats'
  end

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
