Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  resources :listings do
    resources :bookings, { only: [:create, :new, :index, :show, :destroy] } do
      resources :messages, { only: [:create, :show] }
    end
  end

  get '/dashboard', to: 'user#index', as: 'user_dashboard'
end
