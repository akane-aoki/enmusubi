require 'rails_helper'

RSpec.describe "TopPages", type: :request do
  describe "GET /top" do
    it "returns http success" do
      get "/top_pages/top"
      expect(response).to have_http_status(:success)
    end
  end

end
