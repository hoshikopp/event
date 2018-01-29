Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :user, only: :destroy do
    get 'retire'
  end

  resources :events, except: :index do
    resources :tickets, only: [:new, :create, :destroy]
  end
  match '*path' => 'application#error404', via: :all
end
