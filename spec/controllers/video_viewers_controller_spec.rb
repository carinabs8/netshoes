require 'rails_helper'

RSpec.describe VideoViewersController, :type => :controller do
	describe "GET 'create'" do
		it "Should return ok as response" do
			get 'create'
      expect(response).to have_http_status(:success)
		end
	end
end