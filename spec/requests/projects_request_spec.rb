require 'rails_helper'

RSpec.describe "Projects", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/projects/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/projects/create"
      expect(response).to have_http_status(:success)
    end
  end

end
