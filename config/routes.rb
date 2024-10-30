Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  namespace :api do
    namespace :priv do
      namespace :v1 do
        resources :fouls, only: [:index, :show, :create, :update, :destroy]
        resources :games, only: [:index, :show, :create, :update, :destroy]
        resources :seasons, only: [:index, :show, :create, :update, :destroy]
        resources :play_actions, only: [:index, :show, :create, :update, :destroy]
        resources :play_action_groups, only: [:index, :show, :create, :update, :destroy]
        resources :plays, only: [:index, :show, :create, :update, :destroy]
        resources :players, only: [:index, :show, :create, :update, :destroy]
        resources :periods, only: [:index, :show, :create, :update, :destroy]
        resources :season_teams, only: [:index, :show, :create, :update, :destroy]
        resources :shot_grades, only: [:index, :show, :create, :update, :destroy]
        resources :shot_types, only: [:index, :show, :create, :update, :destroy]
        resources :teams, only: [:index, :show, :create, :update, :destroy]
        resources :teammates, only: [:index, :show, :create, :update, :destroy]
        resources :team_levels, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
