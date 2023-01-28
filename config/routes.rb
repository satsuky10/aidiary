Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "groups#index"
  get 'home' => 'home#index'
  resource :group, param: :uid, only: %i(show new create edit update)
  resources :contents, param: :uid
end
