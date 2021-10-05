json.extract! credit_card, :id, :last4, :brand, :exp_month, :exp_year, :country, :stripe_id, :user_id, :created_at, :updated_at
json.url credit_card_url(credit_card, format: :json)
