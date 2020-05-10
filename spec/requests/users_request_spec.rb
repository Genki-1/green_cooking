require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/users/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/users/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/users/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/users/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /confirm" do
    it "returns http success" do
      get "/users/confirm"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /hide" do
    it "returns http success" do
      get "/users/hide"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /following" do
    it "returns http success" do
      get "/users/following"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /followers" do
    it "returns http success" do
      get "/users/followers"
      expect(response).to have_http_status(:success)
    end
  end

end
