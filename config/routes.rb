Rails.application.routes.draw do

  scope constraints: AuthenticatedConstraint.new do
    resources :positions do
      resources :contacts
      resources :events
    end

    delete '/logout', to: 'sessions#destroy'

    root to: 'positions#index'
  end

  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'

end
