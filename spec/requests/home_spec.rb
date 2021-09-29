require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    it "return a correct HTML response" do
      get '/'
      headline = 'Rails MVP Starter Application'
      expect(response.status).to eq 200
      expect(response.parsed_body.index(headline).present?).to eq true
    end
  end
end
