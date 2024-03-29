Rails.application.routes.draw do
  resources :posts, path: "blog"
  resources :photos
  resources :leads
  resources :coupon_codes, path: "coupons"

  get 'templates', to: 'templates#index', as: 'templates'
  get 'templates/dashboard_sidebar'
  get 'templates/dashboard_top_nav'
  get 'templates/modal'
  get 'templates/page_heading'
  get 'templates/notifications'
  get 'templates/form_layout'
  get 'templates/table'
  get 'templates/product_list'
  get 'templates/product_quick_view'
  get 'templates/product_feature'
  get 'templates/header_dropdown'
  get 'templates/feature_sections'
  get 'templates/header_banner'
  get 'templates/hero_sections'
  get 'templates/cta_sections'
  get 'templates/promo_sections'
  get 'templates/goal_landing_page'

  get 'plans', to: 'plans#index', as: 'plans'
  get 'thank-you', to: 'static#thank_you', as: 'thank_you'
  get 'privacy', to: 'static#privacy', as: 'privacy'
  get 'terms', to: 'static#terms', as: 'terms'

  resources :credit_cards, path: 'payments', only: [:new, :create, :destroy]
  get 'account', to: 'account#index', as: 'account'

  get 'bootstrap', to: 'static#bootstrap_demo', as: 'bootstrap_demo'
  get 'tailwind', to: 'static#tailwind_demo', as: 'tailwind_demo'

  root to: "static#index"
  devise_for :users, path_names: {sign_in: 'sign-in', sign_up: 'register', sign_out: 'logout'},
             controllers: {registrations: 'registrations'}

  devise_scope :user do
    get 'app-sumo-deal' => "registrations#deal_signup"
    # post "registrations/start" => "registrations#start"
  end

  namespace :api do
    namespace :v1, format: :json do
      get 'users/attempt-google-sign-in', to: 'users#process_google_oauth', as: 'process_google_oauth'
      get 'users/current', to: 'users#current'

      resources :users
    end
  end

  get 'app', to: "app#index", as: "app_index"
  get 'app/*other' => "app#index"

  get 'admin', to: "admin#index", as: "admin"
  get 'admin/*other' => "admin#index"

  mount StripeEvent::Engine, at: '/webhooks/stripe'
end
