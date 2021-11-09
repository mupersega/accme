Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "profiles#index"

  get "/profiles/new", to: "profiles#new"
  get "/profiles/:id", to: "profiles#show"
  post "/profiles", to: "profiles#create"
end
