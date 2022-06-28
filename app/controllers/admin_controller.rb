class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin

  layout 'empty'

  def index
  end

end
