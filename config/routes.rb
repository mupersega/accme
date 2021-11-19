Rails.application.routes.draw do
  get 'message/new'
  get 'message/create'
  get 'message/update'
  get 'message/delete'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "profiles#index"

  # PROFILE ROUTES
  get "/profiles/new", to: "profiles#new"
  get "/profiles/:id/edit", to: "profiles#edit", as: "edit_profile"
  patch "/profiles/:id", to: "profiles#update"
  get "/profiles/:id", to: "profiles#show", as: 'profile'
  post "/profiles", to: "profiles#create"
  delete "/profiles/:id", to: "profiles#destroy", as: 'destroy_profile'
  
  # MESSAGE ROUTES
  get "/messages/new", to: "messages#new"
  patch "/messages/:id", to: "messages#update"
  delete "/messages/:id", to: "messages#destroy", as: 'destroy_message'
end