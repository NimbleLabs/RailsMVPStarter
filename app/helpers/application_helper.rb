module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def get_auth_token
    if user_signed_in?
      return @user.auth_token if @user.present? && current_user.admin?
      current_user.auth_token
    end
  end

end
