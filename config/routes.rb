Rails.application.routes.draw do
  resources :posts do
    get :search, on: :collection
    collection do
      get :bookmarks
    end
  end
  resources :users
  resource :profile, only: %i[show edit update]
  resources :bookmarks, only: %i[create destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "static_pages#top"
  get 'about_orceanize', to: 'static_pages#about_orceanize'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'terms_of_use', to: 'static_pages#terms_of_use'
  get 'external_link', to: 'static_pages#external_link'
  resources :users, only: %i[new show create edit destroy]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
