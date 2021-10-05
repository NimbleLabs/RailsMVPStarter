require 'rails_helper'

RSpec.describe "Accounts", type: :request do
  describe "GET /account" do
    it "unauthorized if not signed in" do
      get '/account'
      expect(response.status).to eq 302
    end

    it "signed in returns a success code" do
      user = FactoryBot.create(:user)
      sign_in user
      get '/account'
      headline = 'Rails MVP Starter Account'
      expect(response.status).to eq 200
      expect(response.parsed_body.index(headline).present?).to eq true
    end
  end
end
