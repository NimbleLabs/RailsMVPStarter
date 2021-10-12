Rails.application.routes.draw do

  get 'plans', to: 'plans#index', as: 'plans'

  resources :credit_cards, path: 'payments', only: [:new, :create, :destroy]
  get 'admin', to: 'admin#index', as: 'admin'
  get 'account', to: 'account#index', as: 'account'

  get 'bootstrap', to: 'home#bootstrap_demo', as: 'bootstrap_demo'
  get 'tailwind', to: 'home#tailwind_demo', as: 'tailwind_demo'

  root to: "home#index"
  devise_for :users, path_names: {sign_in: 'sign-in', sign_up: 'register', sign_out: 'logout'},
             controllers: {registrations: 'registrations'}

  namespace :api do
    namespace :v1, format: :json do
      get 'users/attempt-google-sign-in', to: 'users#process_google_oauth', as: 'process_google_oauth'
    end
  end

  mount StripeEvent::Engine, at: '/webhooks/stripe'
end
