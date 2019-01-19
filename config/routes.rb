Rails.application.routes.draw do
  get 'account', to: 'account#index', as: 'account'
  devise_for :users, :path_names => {:sign_in => 'signin', :sign_up => 'register', :sign_out => 'logout'},
             :controllers => {registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks'}

  resources :credit_cards, path: '/payments'
  get 'pricing', to: 'home#pricing', as: 'pricing'
  get 'plans/pro', to: 'plans#pro', as: 'pro_plan'
  get 'plans/pro-lifetime', to: 'plans#lifetime_pro', as: 'lifetime_pro'

  get 'admin', to: 'admin#index', as: 'admin'
  get 'privacy', to: 'home#privacy', as: 'privacy'
  get 'terms', to: 'home#terms', as: 'terms'
  get 'home/index'
  root to: 'home#index'

  namespace :api do
    namespace :v1, format: :json do
      get 'users/dev', to: 'users#dev_user', as: 'dev_user'
    end
  end

  get 'app', to: 'app#index', as: 'app'
  get 'app/*other' => 'app#index'
end
