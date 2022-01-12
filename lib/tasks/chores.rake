namespace :chore do

  task import_wordpress_site: :environment do
    require "csv"
    path = Rails.root.join('lib/assets/fitness-hq-top-pages.csv')
    csv = CSV.read(path, headers: true)
    parsed_pages = 0

    csv.each do |line|
      page_path = line['Page']
      service = WebpageService.new(page_path)
      service.download
      parsed_pages += 1
      puts "#{page_path} page loaded, ##{parsed_pages}"
    end

  end

  task create_coupon_codes: :environment do
    (0...10000).each do |index|
      CouponCode.create(code: "AppSumo-#{SecureRandom.alphanumeric(6).upcase}", offer: 'App Sumo Marketplace')
    end
  end

end