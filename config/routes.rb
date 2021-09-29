Rails.application.routes.draw do

  get 'admin', to: 'admin#index', as: 'admin'
  get 'account', to: 'account#index', as: 'account'

  root to: "home#index"
  devise_for :users, path_names: {sign_in: 'sign-in', sign_up: 'register', sign_out: 'logout'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
