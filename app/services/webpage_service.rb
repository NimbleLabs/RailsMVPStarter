class WebpageService
  def initialize(page_path)
    @page_path = page_path
    @old_root_url = "http://www.fitnesshq.com"
    @page_directory = ''
    @page_directory = page_path[1, page_path.length - 2] if page_path.length > 2
    @url = @old_root_url + "#{page_path}"
  end

  def download
    response = HTTParty.get(@url)
    @nokogiri_page = Nokogiri::HTML(response)
    download_images
    download_style_sheets
    download_scripts
    save_page
  end

  def save_page
    page_folder = Rails.root.join("public/#{@page_directory}")
    FileUtils.mkdir_p(page_folder) unless File.directory?(page_folder)
    local_page_path = Rails.root.join("public/#{@page_directory}/index.html")
    File.open(local_page_path, "w") { |f| f.write @nokogiri_page.to_html }
  end

  def download_scripts
    js_folder = Rails.root.join("public/assets/js")
    FileUtils.mkdir_p(js_folder) unless File.directory?(js_folder)

    script_elements = @nokogiri_page.css('script')
    script_elements.each do |script_element|
      next unless script_element['src'].present?
      script_url = "#{script_element['src']}"
      response = HTTParty.get(script_url)

      new_script_name =  "#{script_element['id']}.js"
      js_file_path = Rails.root.join("public/assets/js/#{new_script_name}")
      File.open(js_file_path, "w") { |f| f.write response.parsed_response }

      # TODO: make sure this is in the DOM when written to disk
      script_element['src'] = "https://www.fitnesshq.com/assets/js/#{new_script_name}"
      # ??   node_set.attr("href", "https://www.nokogiri.org")
    end

  end

  def download_style_sheets
    css_folder = Rails.root.join("public/assets/css")
    FileUtils.mkdir_p(css_folder) unless File.directory?(css_folder)

    style_sheet_elements = @nokogiri_page.css('link [rel="stylesheet"]')
    style_sheet_elements.each do |style_sheet_element|
      style_sheet_url = "#{style_sheet_element['href']}"
      response = HTTParty.get(style_sheet_url)

      new_css_name =  "#{style_sheet_element['id']}.css"
      css_file_path = Rails.root.join("public/assets/css/#{new_css_name}")
      File.open(css_file_path, "w") { |f| f.write response.parsed_response }

      # TODO: make sure this is in the DOM when written to disk
      style_sheet_element['href'] = "https://www.fitnesshq.com/assets/css/#{new_css_name}"
    end

  end

  def download_images
    images_folder = Rails.root.join("public/assets/images")
    FileUtils.mkdir_p(images_folder) unless File.directory?(images_folder)
    image_elements = @nokogiri_page.css("p img")
    puts "Image elements: #{image_elements.length}"

    image_elements.each_with_index do |image_element, index|
      image_url = "#{image_element['src']}"

      if image_url.index("#{@old_root_url}/wp-content/uploads").present?
        response = HTTParty.get(image_url)
        # TODO: we should pull the image file extension instead of hard-coding to .jgp
        new_image_name = @page_directory + "-#{index}.jpg"
        image_file_path = Rails.root.join("public/assets/images/#{new_image_name}")
        File.open(image_file_path, "w") { |f| f.write response.parsed_response }

        # TODO: make sure this is in the DOM when written to disk
        image_element['src'] = "https://www.fitnesshq.com/assets/images/#{new_image_name}"
      end
    end
  end
end