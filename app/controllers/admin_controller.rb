class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin

  def index
  end

  private

  def ensure_admin
    return true if user_signed_in? && current_user.admin?

    redirect_to root_path, flash: {alert: "You don't have enough permissions to proceed"}
    false
  end

end
