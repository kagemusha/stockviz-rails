Rails.application.routes.draw do
  resources :groups
  resources :categories
  resources :analyses
  resources :user_profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
