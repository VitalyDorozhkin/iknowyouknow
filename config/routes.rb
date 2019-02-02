Rails.application.routes.draw do
  resources :users
  root "users#index"
  get "sign_up", to:"users#sign_up"
  post "sign_up", to:"users#check"
  get "sign_out", to:"users#sign_out"
end
