require 'rails_helper'

RSpec.describe "Invites", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/invites/index"
      expect(response).to have_http_status(:success)
    end
  end

end
