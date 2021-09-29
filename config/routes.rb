Rails.application.routes.draw do

  get 'admin', to: 'admin#index', as: 'admin'
  get 'account', to: 'account#index', as: 'account'

  root to: "home#index"
  devise_for :users, path_names: {sign_in: 'sign-in', sign_up: 'register', sign_out: 'logout'}

  namespace :api do
    namespace :v1, format: :json do
      get 'users/attempt-google-sign-in', to: 'users#process_google_oauth', as: 'process_google_oauth'
    end
  end

end
