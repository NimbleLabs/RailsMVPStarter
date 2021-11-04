json.extract! coupon_code, :id, :code, :offer, :user_id, :created_at, :updated_at
json.url coupon_code_url(coupon_code, format: :json)
