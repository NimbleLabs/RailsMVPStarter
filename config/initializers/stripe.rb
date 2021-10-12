Stripe.api_key = ENV['STRIPE_SECRET_KEY']
StripeEvent.signing_secret = ENV['STRIPE_SIGNING_SECRET'] # e.g. whsec_...

StripeEvent.configure do |events|
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