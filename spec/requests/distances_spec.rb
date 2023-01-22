require 'rails_helper'

RSpec.describe "Distances", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/distances/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/distances/show"
      expect(response).to have_http_status(:success)
    end
  end

end
