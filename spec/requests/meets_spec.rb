require 'rails_helper'

RSpec.describe "Meets", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/meets/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/meets/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/meets/show"
      expect(response).to have_http_status(:success)
    end
  end

end
