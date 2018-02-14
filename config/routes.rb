Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :search, only: [:index, :show]
  resources :steam_apps, :path => "steamapps"


  resources :fav_apps, :path => "apps"
  resources :news

end
