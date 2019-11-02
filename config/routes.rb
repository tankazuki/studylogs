Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "home#top"

get "/users/new", to: "users#new", as: "user_new"
post "/users/create", to: "users#create", as: "user_create"
get "/user/sign_out", to: "users#sign_out", as: "user_sign_out"

post "users/sign_in", to: "sessions#user_create", as: "user_session_create"
get "/users/sign_in", to: "sessions#user_new", as: "user_sign_in"


end
