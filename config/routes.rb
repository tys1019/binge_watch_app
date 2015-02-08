Rails.application.routes.draw do

  root 'shows#welcome'

  resources :shows, only: [:index]
  resources :lists, only: [:show]
  resources :episodes, only: [:show]

  patch 'episodes/:id', to: 'episodes#update'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

end
