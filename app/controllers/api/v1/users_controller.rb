class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[ index show destroy ]
  before_action :ensure_admin, only: %i[ index show destroy ]

  def index
    @users = User.all #.paginate(page: params[:page])
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {status: 'ok', message: 'User deleted'}
  end

  def current
    if current_user.blank?
      render json: { message: 'unauthorized' }, status: :forbidden
      return
    end

    user_info = {
      id: current_user.slug,
      name: current_user.name,
      auth_token: current_user.auth_token,
      image_url: current_user.image_url
    }

    render json: user_info
  end

  def process_google_oauth
    id_token = flash['google_sign_in']['id_token']
    identity = GoogleSignIn::Identity.new(id_token)
    @user = User.from_google(identity)

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      session[:custom_redirect_url] = root_path
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

end