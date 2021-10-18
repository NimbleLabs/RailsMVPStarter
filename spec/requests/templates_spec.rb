require 'rails_helper'

RSpec.describe "Templates", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/templates/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /dashboard_sidebar" do
    it "returns http success" do
      get "/templates/dashboard_sidebar"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /dashboard_top_nav" do
    it "returns http success" do
      get "/templates/dashboard_top_nav"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /modal" do
    it "returns http success" do
      get "/templates/modal"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /page_heading" do
    it "returns http success" do
      get "/templates/page_heading"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /notifications" do
    it "returns http success" do
      get "/templates/notifications"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /form_layout" do
    it "returns http success" do
      get "/templates/form_layout"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /table" do
    it "returns http success" do
      get "/templates/table"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /product_list" do
    it "returns http success" do
      get "/templates/product_list"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /product_quick_view" do
    it "returns http success" do
      get "/templates/product_quick_view"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /product_feature" do
    it "returns http success" do
      get "/templates/product_feature"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /header_dropdown" do
    it "returns http success" do
      get "/templates/header_dropdown"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /feature_sections" do
    it "returns http success" do
      get "/templates/feature_sections"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /header_banner" do
    it "returns http success" do
      get "/templates/header_banner"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /hero_sections" do
    it "returns http success" do
      get "/templates/hero_sections"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /cta_sections" do
    it "returns http success" do
      get "/templates/cta_sections"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /promo_sections" do
    it "returns http success" do
      get "/templates/promo_sections"
      expect(response).to have_http_status(:success)
    end
  end

end
