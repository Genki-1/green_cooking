require 'rails_helper'

RSpec.describe "Makes", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/makes/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/makes/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
