Stripe.api_key = ENV['STRIPE_SECRET_KEY']
StripeEvent.signing_secret = ENV['STRIPE_SIGNING_SECRET'] # e.g. whsec_...

StripeEvent.configure do |events|

  events.subscribe 'charge.succeeded' do |event|
    charge = event.data.object
    puts '--------------------------------------------'
    puts charge.inspect
    puts '--------------------------------------------'

    payment_params = {
      amount: charge.amount,
      description: charge.description,
      status: charge.status,
      stripe_id: charge.id,
      stripe_customer_id: charge.customer,
      created: charge.created
    }

    payment = Payment.new(payment_params)
    payment.user = User.where(stripe_customer_id: charge.customer).first

    if payment.save
      puts "Payment saved"
    else
      puts "Error saving payment"
    end
  end

  events.subscribe 'customer.subscription.' do |event|
    # Define subscriber behavior based on the event object
    # event.class       #=> Stripe::Event
    # event.type        #=> "charge.failed"
    # event.data.object #=> #<Stripe::Charge:0x3fcb34c115f8>

    subscription = event.data.object
    puts '************************************************'
    puts "Received subscription event, #{event.type}, status #{subscription.status}"

    user = User.where(subscription_id: subscription.id).first
    if user.present?
      user.update_columns(subscription_status: subscription.status)
      puts 'User updated'
    end

    puts '************************************************'

  end

end