require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET /admin" do
    it "admin request fails" do
      user = FactoryBot.create(:user)
      sign_in user
      get '/admin'
      expect(response.status).to eq 302
    end

    it "admin request succeeds" do
      admin_user = FactoryBot.create(:admin)
      sign_in admin_user
      get '/admin'
      expect(response.status).to eq 200
    end
  end
end
