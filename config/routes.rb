Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "groups#index"
  get 'home' => 'home#index'
  resources :groups, param: :uid, only: %i(index new create edit update destroy)
end
