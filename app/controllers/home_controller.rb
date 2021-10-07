class HomeController < ApplicationController
  layout "empty", only: [:bootstrap_demo, :tailwind_demo]

  def index
  end

  def bootstrap_demo
  end

  def tailwind_demo
  end

end
