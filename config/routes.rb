Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  resources :listings do
    resources :bookings, { only: [:create, :new, :index, :show, :destroy] }
  end
end
