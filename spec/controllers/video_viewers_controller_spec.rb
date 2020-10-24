require 'rails_helper'

RSpec.describe VideoViewersController, :type => :controller do
	describe "GET 'create'" do
		it "Should return ok as response even though there werent videos" do
			get 'create'
      expect(response).to have_http_status(:success)
		end

		it "Should return ok as response" do
		end
	end
end