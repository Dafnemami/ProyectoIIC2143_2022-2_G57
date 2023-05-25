require 'rails_helper'

RSpec.describe "Mensajes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/mensajes/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/mensajes/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/mensajes/create"
      expect(response).to have_http_status(:success)
    end
  end

end
