class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]
  before_action :check_captcha, only: [:create]

  def create
    if sign_up_params[:password_confirmation].blank?
      sign_up_params[:password_confirmation] = sign_up_params[:password]
    end

    super

    # necessary?
    if resource.persisted? && session[:invitation_uuid].present?
      session[:invitation_uuid] = nil
    end
  end

  def new
    if params[:uuid].present?
      @invitation = Invitation.find_by_uuid(params[:uuid])
      session[:invitation_uuid] = @invitation.uuid
    end

    super
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :name, :company_name, :invitation_uuid)
    end
  end

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      resource.validate # Look for any other validation errors besides Recaptcha
      respond_with_navigational(resource) { render :new }
    end
  end

  def deal_signup
    build_resource
    session[:deal_signup] = true
  end

end