Rails.application.routes.draw do
  resources :positions do
    resources :events
  end

  root to: 'positions#index'
end
