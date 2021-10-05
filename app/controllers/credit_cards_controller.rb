class CreditCardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_credit_card, only: %i[ destroy ]


  # GET /credit_cards/new
  def new

    if current_user.stripe_customer_id.blank?
      customer = Stripe::Customer.create(email: current_user.email)
      current_user.update_columns(stripe_customer_id: customer['id'])
    else
      customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    end

    @payment_intent = Stripe::PaymentIntent.create(
      customer: customer['id'],
      setup_future_usage: 'off_session',
      amount: 9900,
      currency: 'usd',
      description: 'MVP Starter Application'
    )

    @credit_card = CreditCard.new
  end

  # POST /credit_cards or /credit_cards.json
  def create
    payment_method_id = params[:payment_method_id]
    @payment_method =  Stripe::PaymentMethod.retrieve(payment_method_id)

    @last_credit_card = @payment_method['card']

    credit_card_params = {
      brand: @last_credit_card['brand'],
      country: @last_credit_card['country'],
      exp_month: @last_credit_card['exp_month'],
      exp_year: @last_credit_card['exp_year'],
      last4: @last_credit_card['last4'],
      stripe_id: @payment_method['id']
    }

    @credit_card = CreditCard.new(credit_card_params)
    @credit_card.user = current_user

    respond_to do |format|
      if @credit_card.save
        format.html { redirect_to @credit_card, notice: "Credit card was successfully created." }
        format.json { render :show, status: :created, location: @credit_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @credit_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  def destroy

    begin
      Stripe::PaymentMethod.detach(@credit_card.stripe_id)
    rescue Stripe::InvalidRequestError => exception
      # log this exception?
    end

    @credit_card.destroy

    respond_to do |format|
      format.html { redirect_to account_url, notice: "Credit card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_credit_card
    @credit_card = CreditCard.find(params[:id])
  end

end
