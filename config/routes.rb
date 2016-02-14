Rails.application.routes.draw do
#  namespace :mlb do
#    resources :teams, only: [:index, :show]
#  end
#
#  namespace :nba do
#    resources :teams, only: [:index, :show]
#  end
#
#  namespace :nfl do
#    resources :teams, only: [:index, :show]
#  end
#
  namespace :nhl do
    resources :teams, only: [:index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
