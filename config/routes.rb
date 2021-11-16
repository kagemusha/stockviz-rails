Rails.application.routes.draw do
  resources :factors
  resources :groups
  resources :categories
  resources :analyses
  jsonapi_resource :profile
  jsonapi_resource :profiles
  resources :user_profiles

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
