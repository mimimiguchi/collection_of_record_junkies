require 'rails_helper'

RSpec.describe "Wants", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/wants/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/wants/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
