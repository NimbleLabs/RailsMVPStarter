class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.first_time_user?
      return thank_you_path
    end

    stored_location_for(resource) || root_path
  end

  private

  def ensure_admin
    return true if user_signed_in? && current_user.admin?

    redirect_to root_path, flash: { alert: "You don't have enough permissions to proceed" }
    false
  end

end
