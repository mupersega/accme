Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "profiles#index"

  get "/profiles/new", to: "profiles#new"
  get "/profiles/:id/edit", to: "profiles#edit", as: "edit_profile"
  put "/profiles/:id", to: "profiles#update"
  get "/profiles/:id", to: "profiles#show", as: 'show_profile'
  post "/profiles", to: "profiles#create"
end