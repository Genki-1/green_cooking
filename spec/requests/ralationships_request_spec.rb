require 'rails_helper'

RSpec.describe "Ralationships", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/ralationships/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/ralationships/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
