namespace :chore do

  task import_wordpress_site: :environment do
    require 'fileutils'
    url = "http://www.fitnesshq.com"

    require "csv"
    path = Rails.root.join('lib/assets/fitness-hq-top-pages.csv')
    csv = CSV.read(path, headers: true)

    parsed_pages = 0

    csv.each do |line|
      page_path = line['Page']
      page_directory = ''

      if page_path.length > 2
        page_directory = page_path[1, page_path.length - 2]
      end

      # puts page_path
      # puts page_directory

      # if parsed_pages < 1
        parsed_pages += 1
        page_url = url + "#{page_path}"
        puts "Page url: #{page_url}"
        response = HTTParty.get(page_url)
        page_html = response.parsed_response

        nokogiri_page = Nokogiri::HTML(response)
        # image_elements = nokogiri_page.css("p img")
        # puts "Image elements: #{image_elements.length}"
        #
        # image_elements.each do |image_element|
        #   puts "#{image_element['src']}"
        # end

        page_folder = Rails.root.join("lib/assets/fitnesshq/#{page_directory}")
        FileUtils.mkdir_p(page_folder) unless File.directory?(page_folder)
        local_page_path = Rails.root.join("lib/assets/fitnesshq/#{page_directory}/index.html")
        #File.open(local_page_path, "w") { |f| f.write page_html }
        File.open(local_page_path, "w") { |f| f.write nokogiri_page.to_html }

      puts "#{page_directory} page loaded, ##{parsed_pages}"
        # puts page_html
        # break
      # end

    end

    # require 'open-uri'
    # csv_data = open(path)
    # csv_rows = CSV.parse(csv_data.read)
    # csv_rows.each do |row|
    #   puts row.inspect
    # end

  end

  task create_coupon_codes: :environment do
    (0...10000).each do |index|
      CouponCode.create(code: "AppSumo-#{SecureRandom.alphanumeric(6).upcase}", offer: 'App Sumo Marketplace')
    end
  end

end