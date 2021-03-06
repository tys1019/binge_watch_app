Rails.application.routes.draw do

  root 'shows#welcome'

  resources :shows, only: [:index, :show]
  resources :lists, only: [:index, :new, :create, :show]
  resources :episodes, only: [:show]
  resources :seasons, only: [:show]

  post 'lists/:id', to: 'lists#destroy'

  post 'vieweds/:id', to: 'vieweds#toggle_viewed'

  patch 'episodes/:id', to: 'episodes#update'


  patch 'seasons/:id', to: 'seasons#update'
  post 'seasons/:id', to: 'seasons#update'


  post 'shows/:id', to: 'shows#update'
  # patch 'shows/:id', to: 'shows#remove_from_queue'
  # post 'shows/:id', to: 'shows#add_to_queue'

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
