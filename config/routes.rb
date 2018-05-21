Rails.application.routes.draw do
  resources :playlists
  resources :albums
  resources :songs
  resources :bands
  resources :artists
  resources :apidocs, only: [:index]
  mount SwaggerUiEngine::Engine, at: "/api_docs"
end
