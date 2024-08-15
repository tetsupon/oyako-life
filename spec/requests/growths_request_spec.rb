require 'rails_helper'

RSpec.describe "Growths", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/growths/index"
      expect(response).to have_http_status(:success)
    end
  end

end
