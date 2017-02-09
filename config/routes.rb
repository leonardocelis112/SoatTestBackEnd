Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: :create
  match 'sessions', to: 'sessions#options', via: [:options]
  match 'users', to: 'users#options', via: [:options]
  match 'users/:id', to: 'users#options', via: [:options]
  resources :users, only: [:create, :update] do
    resources :soat_insurances, only: [:index, :create]
    match 'soat_insurances', to: 'soat_insurances#options', via: [:options]
    match 'soat_insurances/id', to: 'soat_insurances#options', via: [:options]
  end
  match 'payments', to: 'payments#options', via: [:options]
  match 'payments/:id', to: 'payments#options', via: [:options]
  resources :payments, only: [:index, :create, :show]
  match 'vehicle_classes', to: 'vehicle_classes#options', via: [:options]
  resources :vehicle_classes, only: :index
end
