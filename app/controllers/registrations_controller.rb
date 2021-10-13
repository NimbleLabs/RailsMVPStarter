class RegistrationsController < Devise::RegistrationsController

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

end