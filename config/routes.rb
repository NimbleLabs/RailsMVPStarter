Rails.application.routes.draw do
  get 'admin/index', as: 'admin'
  get 'account/index', as: 'account'

  root to: "home#index"
  devise_for :users, path_names: {sign_in: 'sign-in', sign_up: 'register', sign_out: 'logout'}

  scope module: 'admin', path: '/admin' do
    resources :users
  end
end
