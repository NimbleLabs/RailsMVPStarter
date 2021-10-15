class RegistrationsController < Devise::RegistrationsController

  def create
    if sign_up_params[:password_confirmation].blank?
      sign_up_params[:password_confirmation] = sign_up_params[:password]
    end

    super
  end

  def new
    super
  end

end