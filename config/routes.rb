Rails.application.routes.draw do
  resources :positions do
    resources :contacts
    resources :events
  end

  root to: 'positions#index'
end
