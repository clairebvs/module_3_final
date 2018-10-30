Rails.application.routes.draw do
  root "welcome#index"

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show]
      post '/games/:game_id/plays', to: 'games/plays#create'
    end
  end
end
