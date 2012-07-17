RodarRails::Application.routes.draw do
  resources :buses
  resources :companies
  root :to => 'main#index'
end
