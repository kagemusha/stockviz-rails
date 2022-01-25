Rails.application.routes.draw do
  resources :groups
  resources :categories
  jsonapi_resources :analyses
  jsonapi_resources :factors
  jsonapi_resources :events
  jsonapi_resource :profile
  jsonapi_resource :profiles

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
