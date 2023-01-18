require 'rails_helper'

RSpec.describe "Cookings", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/cookings/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/cookings/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
