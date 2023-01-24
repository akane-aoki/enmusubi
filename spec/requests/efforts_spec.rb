require 'rails_helper'

RSpec.describe "Efforts", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/efforts/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/efforts/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/efforts/index"
      expect(response).to have_http_status(:success)
    end
  end

end
