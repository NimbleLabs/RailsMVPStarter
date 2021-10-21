class AppController < ApplicationController
  before_action :authenticate_user!
  layout 'empty'

  def index
  end
end
