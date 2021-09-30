class Api::V1::UsersController < ApplicationController

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