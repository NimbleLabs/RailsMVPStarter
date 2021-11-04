namespace :chore do
  task create_coupon_codes: :environment do
    (0...10000).each do |index|
      CouponCode.create(code: "AppSumo-#{SecureRandom.alphanumeric(6).upcase}", offer: 'App Sumo Marketplace')
    end
  end

end