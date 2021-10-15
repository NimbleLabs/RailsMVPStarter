class PlansController < ApplicationController
  def index
    @monthly_plan = OpenStruct.new(price_id: ENV['STRIPE_MONTHLY_PRICE'], amount: 9, period: 'month')
    @yearly_plan = OpenStruct.new(price_id: ENV['STRIPE_YEARLY_PRICE'], amount: 99, period: 'year')
  end
end
