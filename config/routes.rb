Jets.application.routes.draw do
  root "main#index"

  get "/callback", to: "main#index", as: :callback
  get "/privacy", to: "static#index", as: :privacy
  get "authenticated", to: "main#authenticated", as: :authenticated

  scope module: :revise_auth do

    get "sign_up", to: "registrations#new", as: :sign_up
    post "sign_up", to: "registrations#create"
    get "login", to: "sessions#new", as: :login
    post "login", to: "sessions#create"

    get "profile", to: "registrations#edit", as: :profile
    patch "profile", to: "registrations#update"
    delete "profile", to: "registrations#delete"
    patch "profile/email", to: "email#update"
    get "profile/password", to: "registrations#edit", as: :profile_password
    patch "profile/password", to: "password#update"

    # Email confirmation
    get "profile/email", to: "email#show", as: :profile_email

    delete "logout", to: "sessions#delete"
  end
  # Admin Routes
  namespace :admin do
    get "users/:id", to: "users#show", as: :admin_users_show
    patch "users", to: "users#update", as: :admin_users
    delete "users/:id", to: "users#delete", as: :admin_users
    get "users", to: "users#index", as: :admin_users
    get "songs", to: "songs#index", as: :admin_songs
    patch "songs", to: "songs#update", as: :admin_songs
    get "songs/:id", to: "songs#show", as: :admin_songs_show
    get "dashboard", to: "dashboard#show", as: :admin
    root "dashboard#show"
  end



  # API routes
  namespace :api do
    namespace :v1 do
      resource :me, only: [:show, :delete]
      resource :users, only: :create
      resource :auth, only: [:create, :delete]
      resources :refresh_songs, only: :index
      resources :url_to_songs, only: :index
      resources :chord_tabs, only: [:index]
      get "chord_tabs/:id", to: "chord_tabs#show"
      resources :playlist_songs, only: [:create]
      get "playlist_songs/:id", to: "playlist_songs#show"
      resources :user_favorite_songs, only: [:index, :show, :update, :delete]
      resources :playlists, only: [:index, :create, :update, :delete]
      resources :songs, only: [:index, :show]
    end
  end

  # The jets/public#show controller can serve static utf8 content out of the public folder.
  # Note, as part of the deploy process Jets uploads files in the public folder to s3
  # and serves them out of s3 directly. S3 is well suited to serve static assets.
  # More info here: https://rubyonjets.com/docs/extras/assets-serving/
  any "*catchall", to: "jets/public#show"
end
